require "rails_helper"

RSpec.feature "visitor removes an item from their cart" do
  scenario "they do not see the removed item in their cart" do
    item = create(:item)

    visit "/items"
    click_on "Add to Cart"

    visit "/cart"

    click_on "Remove"

    expect(current_path).to eq "/cart"

    within(".alert-success") do
      success = "Successfully removed #{item.title} from your cart."
      expect(page).to have_content success
      expect(page).to have_link item.title, href: item_path(item.id)
    end

    within(".cart-items") do
      expect(page).not_to have_content item.title
      expect(page).not_to have_content("Shiny")
      expect(page).not_to have_content("$10.00")
    end
  end

  scenario "they accidentally remove item and click on backup link" do
    item = create(:item)

    visit "/items"
    click_on "Add to Cart"
    visit "/cart"
    click_on "Remove"

    click_link item.title

    expect(page).to have_content item.title
    expect(page).to have_button("Add to Cart")
  end
end

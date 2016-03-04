require "rails_helper"

RSpec.feature "visitor can add items to cart" do
  scenario "visitor sees items and total price in cart" do
    category_one = create(:category)
    item_one = create(:item)
    category_one.items << item_one

    visit "/#{category_one.title}"
    expect(page).to have_content("Cart (0)")

    click_on "Add to Cart"
    expect(page).to have_content("#{item_one.title} added to cart!")
    expect(page).to have_content("Cart (1)")

    click_link "Cart"

    expect(current_path).to eq "/cart"

    within(".cart-items") do
      expect(page).to have_content(item_one.title)
      expect(page).to have_content(item_one.description)
      expect(page).to have_content("$0.01")
      expect(page).to have_css("img[src=\"/images/horseshoe.png\"]")
    end

    within(".cart-container") do
      expect(page).to have_content("Total: $0.01")
    end
  end
end

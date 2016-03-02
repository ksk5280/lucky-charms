require "rails_helper"

RSpec.feature "visitor removes an item from their cart" do
  scenario "they do not see the removed item in their cart" do
    cat1 = Category.create(title: "charms")
    item = cat1.items.create(title: "Lucky Penny",
                             description: "Shiny",
                             price: 1000,
                             image: "/images/Penny.png",)
    visit "/items"
    click_on "Add to Cart"

    visit "/cart"

    click_link "Remove"

    expect(current_path).to eq "/cart"

    within(".alert-success") do
      success = "Successfully removed Lucky Penny from your cart."
      expect(page).to have_content success
      expect(page).to have_link "Lucky Penny", href: item_path(item.id)
    end

    within(".cart-items") do
      expect(page).not_to have_content("Lucky Penny")
      expect(page).not_to have_content("Shiny")
      expect(page).not_to have_content("$10.00")
      expect(page).not_to have_css("img[src=\"/images/Penny.png\"]")
    end
  end
end

require "rails_helper"

RSpec.feature "visitor can add items to cart" do
  scenario "visitor sees items and total price in cart" do
    cat1 = Category.create(title: "charms")
    cat1.items << Item.create(title: "Lucky Penny",
                              description: "Shiny",
                              price: 1000,
                              image: "/images/Penny.png",)

    visit "/items"

    click_on "Add to Cart"
    click_on "Cart"

    expect(current_path).to eq "/cart"

    within(".cart-items") do
      expect(page).to have_content("Lucky Penny")
      expect(page).to have_content("Shiny")
      expect(page).to have_content("$10.00")
      expect(page).to have_css("img", text:"/images/Penny.png")
      expect(page).to have_content("Total: $10.00")
    end
  end
end
# Background: Items, and a user that is not logged in
#       As a visitor
#       When I visit any page with an item on it
#       I should see a link or button for "Add to Cart"
#       When I click "Add to cart" for that item
#       And I click a link or button to view cart
#       And my current path should be "/cart"
#       And I should see a small image, title, description and price for the item I just added
#       And there should be a "total" price for the cart that should be the sum of all items in the cart

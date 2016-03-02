require "rails_helper"

RSpec.feature "visitor can add items to cart" do
  scenario "visitor sees items and total price in cart" do
    cat1 = Category.create(title: "charms")
    cat1.items.create(title: "Lucky Penny",
                      description: "Shiny",
                      price: 1000,
                      image: "/images/Penny.png",)

    visit "/items"
    expect(page).to have_content("Cart (0)")

    click_on "Add to Cart"
    expect(page).to have_content("Lucky Penny added to cart!")
    expect(page).to have_content("Cart (1)")

    click_on "Cart"

    expect(current_path).to eq "/cart_items"

    within(".cart-items") do
      expect(page).to have_content("Lucky Penny")
      expect(page).to have_content("Shiny")
      expect(page).to have_content("$10.00")
      expect(page).to have_css("img[src=\"/images/Penny.png\"]")
    end

    within(".cart-container") do
      expect(page).to have_content("Total: $10.00")
    end
  end
end

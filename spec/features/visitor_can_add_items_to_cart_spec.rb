require "rails_helper"

RSpec.feature "visitor can add items to cart" do
  scenario "visitor sees items and total price in cart" do
    category_one = create(:category)
    category_one.items << create(:item)

    visit "/#{category_one.title}"
    expect(page).to have_content("Cart (0)")

    click_on "Add to Cart"
    expect(page).to have_content("Lucky Item 1 added to cart!")
    expect(page).to have_content("Cart (1)")

    click_on "Cart"

    expect(current_path).to eq "/cart_items"

    within(".cart-items") do
      expect(page).to have_content("Lucky Item 1")
      expect(page).to have_content("1 description")
      expect(page).to have_content("$0.01")
      expect(page).to have_css("img[src=\"http://bit.ly/1RlgZV5\"]")
    end

    within(".cart-container") do
      expect(page).to have_content("Total: $0.01")
    end
  end
end

require "rails_helper"

RSpec.feature "visitor can logout and has items in the cart" do
  scenario "sees items in cart" do
    user = create(:user)
    item1 = create(:item)
    visit "/"
    first(:link, "Login").click
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_on "Login to your account"
    visit "/items"
    click_on "Add to Cart"
    click_on "Add to Cart"
    expect(page).to have_content "Cart (2)"
    click_on "Logout"
    visit "/cart"

    within(".cart-items") do
      expect(page).to have_content item1.title
      expect(page).to have_content "$0.01"
      expect(page).to have_content "Qty. 2"
      expect(page).to have_content "Subtotal: $0.02"
    end
    expect(page).to have_content "Total: $0.02"
  end
end

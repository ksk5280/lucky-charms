require "rails_helper"

RSpec.feature "User can checkout" do
  scenario "they see order they just placed in a table" do
    user = create(:user)
    item = create(:item)

    visit "/items"
    click_on "Add to Cart"

    visit "/cart"
    expect(page).to have_content(item.title)
    click_on "Checkout"

    expect(current_path).to eq(login_path)
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_on "Login to your account"

    expect(page).to have_content "Logged in as #{user.username}"
    visit "/cart"
    expect(page).to have_content(item.title)
    click_on "Checkout"

    expect(current_path).to eq("/orders/#{Order.last.id}")
    expect(page).to have_content("Order was successfully placed!")
    expect(page).to have_content("Cart (0)")

    click_link "All Orders"
    within "table" do
      expect(page).to have_content "##{Order.last.id}"
    end
  end
end

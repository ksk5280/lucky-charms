require "rails_helper"

RSpec.feature "User gets an email after order is placed" do
  scenario "sees flash on screen saying email has been sent" do
    create(:item)
    User.create(username: "erinna",
                password: "password",
                first_name: "Erinna",
                last_name: "Chen",
                address: "the basement",
                email: "erinna.chen@gmail.com")

    visit "/login"
    fill_in "Username", with: "erinna"
    fill_in "Password", with: "password"
    click_on "Login to your account"

    visit "/items"
    click_on "Add to Cart"
    first(:link, "Cart").click
    click_on "Checkout"

    confirmation = "An email has been sent to: erinna.chen@gmail.com"
    expect(page).to have_content confirmation
    expect(ActionMailer::Base.deliveries.count).to eq 1
  end
end

require "rails_helper"

RSpec.feature "user can only view own information" do
  scenario "user sees own info, not others" do
    User.create(username: "brennan", password: "password")

    visit "/login"
    fill_in "Username", with: "brennan"
    fill_in "Password", with: "password"
    click_on "Login to your account"

    visit user_path
    expect(page).to have_content("Account Information")
  end

  scenario "visitor cannot see user pages" do
    user1 = User.create(username: "brennan", password: "password")

    visit "/"
    visit user_path
    expect(page).to have_content("Out of Luck")
  end
end

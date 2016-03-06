require "rails_helper"

RSpec.feature "visitor can create account" do
  context "enters valid username and password" do
    scenario "visitor logs in and sees dashboard" do
      visit "/"
      first(:link, "Create Account").click

      fill_in "Username", with: "brennan"
      fill_in "Password", with: "password"

      click_button "Create Account"
      expect(current_path).to eq "/dashboard"
      expect(page).to have_content("Logged in as brennan")
      expect(page).to have_content("Your Orders")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end

  context "enters an existing username" do
    scenario "sees error message and create account page" do
      user = create(:user)

      visit "/"
      first(:link, "Create Account").click
      fill_in "Username", with: user.username
      fill_in "Password", with: "password"
      click_button "Create Account"

      expect(page).to have_content "Invalid account details. Please try again."
      expect(page).not_to have_content user.username
    end
  end
end

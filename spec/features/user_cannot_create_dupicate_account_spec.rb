require "rails_helper"

RSpec.feature "User cannot create a duplicate account" do
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

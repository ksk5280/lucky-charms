require "rails_helper"

RSpec.feature "User cannot login without valid password" do
  scenario "see login page" do
    user = create(:user)
    visit "/"
    first(:link, "Login").click
    fill_in "Username", with: user.username
    fill_in "Password", with: "notmypassword"
    click_button "Login"

    expect(page).to have_content "Invalid login details. Please try again."
    expect(page).not_to have_content user.username
  end
end

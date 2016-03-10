require "rails_helper"

RSpec.feature "Admin can only modify own info spec" do
  context "Logged in admin edits own info" do
    scenario "sees updated information" do
      admin = create(:user, role: 1)
      visit "/login"
      fill_in "Username", with: admin.username
      fill_in "Password", with: "password"
      click_button "Login"

      click_link "Update Account"
      fill_in "Username", with: "newusername"
      fill_in "Password", with: "newpassword"
      fill_in "First name", with: "Janice"
      fill_in "Last name", with: "Doer"
      fill_in "Address", with: "Union Station, Denver, CO 80202"

      click_button "Update Account"

      expect(page).to have_content "Account successfully updated."
      expect(page).to have_content "Name: Janice Doer"
      expect(page).to have_content "Address: Union Station, Denver, CO 80202"
      click_link "Logout"

      visit "/login"
      fill_in "Username", with: "newusername"
      fill_in "Password", with: "newpassword"
      click_button "Login"

      expect(page).to have_content "Logged in as newusername"
    end
  end
end

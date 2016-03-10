require "rails_helper"

RSpec.feature "User can only modify own info spec" do
  context "Logged in user edits own info" do
    scenario "sees updated information" do
      user1 = create(:user)
      visit "/login"
      fill_in "Username", with: user1.username
      fill_in "Password", with: "password"
      click_button "Login"

      click_link "My Account"
      click_link "Update Account"
      fill_in "Username", with: "newusername"
      fill_in "Password", with: "newpassword"
      fill_in "First name", with: "Janice"
      fill_in "Last name", with: "Doer"
      fill_in "Address", with: "Union Station, Denver, CO 80202"
      fill_in "Email", with: "jane@gmail.com"

      click_button "Update Account"

      expect(page).to have_content "Account successfully updated."
      expect(page).to have_content "Name: Janice Doer"
      expect(page).to have_content "Address: Union Station, Denver, CO 80202"
      expect(page).to have_content "Email: jane@gmail.com"
      click_link "Logout"

      visit "/login"
      fill_in "Username", with: "newusername"
      fill_in "Password", with: "newpassword"
      click_button "Login"

      expect(page).to have_content "Logged in as newusername"
      expect(page).to have_content "Name: Janice Doer"
      expect(page).to have_content "Address: Union Station, Denver, CO 80202"
    end
  end

  context "Not logged in visitor tries to edit an existing user's info" do
    scenario "sees a 404 page" do
      user1 = create(:user)

      visit edit_user_path

      expect(page).to have_content "The page you were looking for doesn't exist"
    end
  end
end

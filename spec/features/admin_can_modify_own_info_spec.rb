require "rails_helper"

RSpec.feature "Admin can only modify own info spec" do
  context "Logged in admin" do
    scenario "sees updated information" do
      admin = create(:user, role: 1)
      visit "/login"
      fill_in "Username", with: admin.username
      fill_in "Password", with: "password"
      click_button "Login"

      click_link "Update Account"
      fill_in "Username", with: "newusername"
      fill_in "Password", with: "newpassword"
      click_button "Update Account"

      expect(page).to have_content "Account successfully updated."
    end

    scenario "sees a 404 page" do
      admin = create(:user, role: 1)
      user2 = User.create(username: "johndoe", password: "password")
      visit "/login"
      fill_in "Username", with: admin.username
      fill_in "Password", with: "password"
      click_button "Login"

      visit "/users/#{user2.id}/edit"

      expect(page).to have_content "The page you were looking for doesn't exist"
    end
  end
end

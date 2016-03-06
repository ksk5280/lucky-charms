require "rails_helper"

RSpec.feature "User can only modify own info spec" do
  context "Logged in user" do
    scenario "sees updated information" do
      user1 = create(:user)
      visit "/login"
      fill_in "Username", with: user1.username
      fill_in "Password", with: "password"
      click_button "Login"

      click_link "Update Account"
      fill_in "Username", with: "newusername"
      fill_in "Password", with: "newpassword"
      click_button "Update Account"

      expect(page).to have_content "Account successfully updated."
    end

    scenario "sees a 404 page" do
      user1 = create(:user)
      user2 = User.create(username: "johndoe", password: "password")
      visit "/login"
      fill_in "Username", with: user1.username
      fill_in "Password", with: "password"
      click_button "Login"

      visit "/users/#{user2.id}/edit"

      expect(page).to have_content "The page you were looking for doesn't exist"
    end
  end

  context "User not logged in" do
    scenario "sees a 404 page" do
      user1 = create(:user)

      visit "/users/#{user1.id}/edit"

      expect(page).to have_content "The page you were looking for doesn't exist"
    end
  end
end

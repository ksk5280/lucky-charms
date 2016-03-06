require "rails_helper"

RSpec.feature "Admin can log in" do
  scenario "admin sees dashboard after logging in" do
    User.create(username: "admin", password: "password", role: 1)

    visit "/login"
    fill_in "Username", with: "admin"
    fill_in "Password", with: "password"
    click_on "Login to your account"

    expect(current_path).to eq "/admin/dashboard"
  end
end

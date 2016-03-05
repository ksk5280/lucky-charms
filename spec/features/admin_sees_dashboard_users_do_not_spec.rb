require "rails_helper"

RSpec.feature "admin sees dashboard, users do not" do
  scenario "admin sees Admin Dashboard page" do
    User.create(username: "admin", password: "password", role: 1)

    visit "/login"
    fill_in "Username", with: "admin"
    fill_in "Password", with: "password"
    click_on "Login to your account"

    expect(current_path).to eq "/admin/dashboard"
    expect(page).to have_content("Admin Dashboard")
  end
  scenario "signed in user gets 404 on admin dashboard" do
    User.create(username: "pleb", password: "password", role: 0)

    visit "/login"
    fill_in "Username", with: "pleb"
    fill_in "Password", with: "password"
    click_on "Login to your account"
    visit "/admin/dashboard"

    expect(page).to have_content("Out of Luck!")
  end
  scenario "visitor gets 404 on admin dashboard" do
    visit "/admin/dashboard"

    expect(page).to have_content("Out of Luck!")
  end
end

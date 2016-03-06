require "rails_helper"

RSpec.feature "visitor can log in" do
  scenario "visitor logs in and sees dashboard" do
    visit "/"

    expect(page).to have_content("Login")

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

RSpec.feature "logged in user sees items in cart put there before logging in" do
  scenario "visitor turned user sees items in cart" do
    category = create(:category_with_items)
    User.create(username: "brennan", password: "password")

    visit "/items"
    category.items.each { |item| expect(page).to have_content(item.title) }

    within ".items" do
      first(:button, "Add to Cart").click
    end

    visit "/cart"
    expect(page).to have_content(category.items.first.title)

    click_on "Login"

    fill_in "Username", with: "brennan"
    fill_in "Password", with: "password"
    click_on "Login to your account"

    visit "/cart"

    expect(page).to have_content(category.items.first.title)
    expect(page).to_not have_content(category.items[1].title)
    expect(page).to_not have_content(category.items.last.title)
  end
end

RSpec.feature "clicking logout ends session and changes login/out link" do
  scenario "user turns visitor and sees logout link change" do
    User.create(username: "brennan", password: "password")

    visit "/"
    first(:link, "Login").click

    fill_in "Username", with: "brennan"
    fill_in "Password", with: "password"
    click_on "Login to your account"

    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")

    click_on "Logout"

    expect(page).to have_content("Login")
    expect(page).to_not have_content("Logout")
  end
end

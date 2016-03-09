require "rails_helper"

RSpec.feature "User checks for rain in the forecast near them" do
  scenario "user sees local forecast" do

    visit "/weather/new"

    fill_in "US City", with: "Denver"
    click_on "Check Weather"

    expect(page).to have_content("Your Forecast")
    expect(page).to have_content("Today")
    expect(page).to have_content("Tomorrow")
  end
end

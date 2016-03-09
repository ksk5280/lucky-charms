require "rails_helper"

RSpec.feature "User checks for rain in the forecast near them" do
  scenario "user sees local forecast" do
    weather = Category.create(title: "Weather",
                              created_at: Time.now,
                              image: "sunshine.png")
    weather.items << Item.create(title: "Uncatchable Leprechaun",
                                 description: "You're not having luck with the
                                 weather, but if you're inside, try to nab this
                                 little guy and get his gold!",
                                 price: 9999,
                                 image: "pot_o_gold.png")
    weather.items << Item.create(title: "Pot O' Gold",
                                 description: "After a good rain, you were
                                 lucky enough to find the pot of gold at the
                                 end of the rainbow!",
                                 price: 9999,
                                 image: "pot_o_gold.png")
    weather.items << Item.create(title: "Four-Leaf Clover",
                                 description: "The sun is shining so brightly
                                 that spotting this little guy wasn't a matter
                                 of luck!",
                                 price: 999,
                                 image: "sunshine.png")

    visit "/weather/new"

    fill_in "US City", with: "Denver"
    click_on "Check Weather"

    expect(page).to have_content("Your Forecast")
    expect(page).to have_content("Today")
    expect(page).to have_content("Tomorrow")
  end
end

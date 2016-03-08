require "rails_helper"

RSpec.feature "Visitor cannot view item not in database" do
  scenario "sees a 404 page" do
    expect(Item.count).to eq 0
    visit "/items/25"

    expect(page).to have_content "The page you were looking for doesn't exist"
  end
end

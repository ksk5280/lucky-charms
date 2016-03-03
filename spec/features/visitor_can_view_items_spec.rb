require "rails_helper"

RSpec.feature "Visitor can view items" do
  scenario "they see all items" do
    create(:item)
    create(:item)

    visit "/items"

    within ".items" do
      expect(page).to have_content "Lucky Item 8"
      expect(page).to have_content "$0.01"
      expect(page).to have_content "Lucky Item 9"
      expect(page).to have_content "$0.01"
    end
  end
end

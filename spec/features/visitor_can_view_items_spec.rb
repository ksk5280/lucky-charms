require "rails_helper"

RSpec.feature "Visitor can view items" do
  scenario "they see all items" do
    item1 = create(:item)
    item2 = create(:item)

    visit "/items"

    within ".items" do
      expect(page).to have_content item1.title
      expect(page).to have_content "$0.01"
      expect(page).to have_content item2.title
      expect(page).to have_content "$0.01"
    end
  end
end

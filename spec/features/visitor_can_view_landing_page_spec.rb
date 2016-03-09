require "rails_helper"

RSpec.feature "Visitor can view landing page" do
  scenario "they see links to items and categories" do
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)

    visit root_path

    within ".categories" do
      expect(page).to have_link item1.categories.first.title
      expect(page).to have_link item2.categories.first.title
      expect(page).to have_link item3.categories.first.title
    end

    within ".items" do
      expect(page).to have_link item1.title
      expect(page).to have_link item2.title
      expect(page).to have_link item3.title
    end
  end
end

require "rails_helper"

RSpec.feature "Visitor can view landing page" do
  scenario "they see links to items and categories" do
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)
    category1 = create(:category)
    category2 = create(:category)
    category3 = create(:category)

    visit root_path

    within ".categories" do
      expect(page).to have_link category1.title
      expect(page).to have_link category2.title
      expect(page).to have_link category3.title
    end

    within ".items" do
      expect(page).to have_link item1.title
      expect(page).to have_link item2.title
      expect(page).to have_link item3.title
    end
  end
end

require "rails_helper"

RSpec.feature "visitor cannot see retired items" do
  scenario "only sees items that are not retired" do
    item1 = create(:item)
    item2 = create(:item, price: 300, retired: true)
    visit "/items"

    within(".items") do
      expect(page).to have_content item1.title
      expect(page).to have_content "$0.01"

      expect(page).not_to have_content item2.title
      expect(page).not_to have_content "$3.00"
    end
  end
end

require "rails_helper"

RSpec.feature "Visitor can browse items by category" do
  scenario "they see all items in a category" do
    item_one = create(:item)
    item_two = create(:item)
    category_one = item_one.categories.first
    category_two = item_two.categories.first

    visit "/#{category_one.title}"

    within ".items" do
      expect(page).to have_content item_one.title
      expect(page).to_not have_content item_two.title
    end

    visit "/#{category_two.title}"

    within ".items" do
      expect(page).to_not have_content item_one.title
      expect(page).to have_content item_two.title
    end
  end

  context "they visit a url for an unknown category" do
    scenario "they see the 404 page" do
      visit "/jdklsjfds"

      expect(page).to have_content "The page you were looking for doesn't exist"
    end
  end
end

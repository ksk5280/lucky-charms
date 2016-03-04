require "rails_helper"

RSpec.feature "Visitor can browse items by category" do
  scenario "they see all items in a category" do
    category_one = create(:category_with_items)
    item_one, item_two, item_three = category_one.items
    category_two = create(:category_with_items)
    item_four, item_five, _item_six = category_two.items
    visit "/#{category_one.title}"

    within ".items" do
      expect(page).to have_content item_one.title
      expect(page).to have_content item_three.title
      expect(page).to_not have_content item_four.title
      expect(page).to_not have_content item_five.title
    end

    visit "/#{category_two.title}"

    within ".items" do
      expect(page).to_not have_content item_one.title
      expect(page).to_not have_content item_two.title
      expect(page).to have_content item_four.title
      expect(page).to have_content item_five.title
    end
  end

  context "they visit a url for an unknown category" do
    scenario "they see the 404 page" do
      visit "/jdklsjfds"

      expect(page).to have_content "The page you were looking for doesn't exist"
    end
  end
end

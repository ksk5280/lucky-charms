require "rails_helper"

RSpec.feature "Visitor can browse items by category" do
  scenario "they see all items in a category" do
    category_one = create(:category_with_items)
    category_two = create(:category_with_items)

    visit "/#{category_one.title}"

    within ".items" do
      expect(page).to have_content "Lucky Item 2"
      expect(page).to have_content "Lucky Item 3"
      expect(page).to_not have_content "Lucky Item 5"
      expect(page).to_not have_content "Lucky Item 6"
    end

    visit "/#{category_two.title}"

    within ".items" do
      expect(page).to_not have_content "Lucky Item 2"
      expect(page).to_not have_content "Lucky Item 3"
      expect(page).to have_content "Lucky Item 5"
      expect(page).to have_content "Lucky Item 6"
    end
  end

  context "they visit a url for an unknown category" do
    scenario "they see the 404 page" do
      visit "/jdklsjfds"

      expect(page).to have_content "The page you were looking for doesn't exist"
    end
  end
end

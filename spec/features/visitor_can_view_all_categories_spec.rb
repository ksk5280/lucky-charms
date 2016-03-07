require "rails_helper"

RSpec.feature "Visitor can view all categories from landing page" do
  scenario "they see categories" do
    category1 = create(:category)
    category2 = create(:category)
    category3 = create(:category)

    visit root_path
    click_on "all categories"

    expect(current_path).to eq(categories_path)
    within ".categories" do
      expect(page).to have_content category1.title
      expect(page).to have_content category2.title
      expect(page).to have_content category3.title
    end
  end
end

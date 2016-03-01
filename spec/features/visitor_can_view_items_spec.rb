require "rails_helper"

RSpec.feature "Visitor can view items" do
  scenario "they see all items" do
    Item.create(title: "Lucky Penny",
                description: "Shiny",
                price: 1000,
                image: "/images/Penny.png")
    Item.create(title: "Horse Shoe",
                description: "Heavy",
                price: 2000,
                image: "/images/horseshoe.png")

    visit "/items"

    within ".items" do
      expect(page).to have_content "Lucky Penny"
      expect(page).to have_content "$10.00"
      expect(page).to have_css("img[alt='Lucky Penny']")
      expect(page).to have_css("img[src=\"/images/Penny.png\"]")
      expect(page).to have_content "Horse Shoe"
      expect(page).to have_content "$20.00"
      expect(page).to have_css("img[alt='Horse Shoe']")
      expect(page).to have_css("img[src=\"/images/horseshoe.png\"]")
    end
  end
end

require "rails_helper"

RSpec.feature "Visitor can browse items by category" do
  scenario "they see all items in a category" do
    cat1 = Category.create(title: "charms")
    cat2 = Category.create(title: "potions")
    cat1.items.create(title: "Lucky Penny",
                      description: "Shiny",
                      price: 1000,
                      image: "/images/Penny.png",)
    cat1.items.create(title: "Horse Shoe",
                      description: "Heavy",
                      price: 2000,
                      image: "/images/horseshoe.png",)
    cat2.items.create(title: "Love Potion #9",
                      description: "Potent",
                      price: 5000,
                      image: "/images/horseshoe.png",)
    cat2.items.create(title: "Luck Potion",
                      description: "Lucky",
                      price: 5000,
                      image: "/images/horseshoe.png",)

    visit "/charms"

    within ".items" do
      expect(page).to have_content "Lucky Penny"
      expect(page).to have_content "Horse Shoe"
      expect(page).to_not have_content "Love Potion #9"
      expect(page).to_not have_content "Luck Potion"
    end

    visit "/potions"

    within ".items" do
      expect(page).to_not have_content "Lucky Penny"
      expect(page).to_not have_content "Horse Shoe"
      expect(page).to have_content "Love Potion #9"
      expect(page).to have_content "Luck Potion"
    end
  end
end

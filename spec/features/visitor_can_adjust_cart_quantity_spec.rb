require "rails_helper"

RSpec.feature "Visitor can adjust cart quantity" do
  before(:each) do
    cat1 = Category.create(title: "charms")
    cat1.items.create(title: "Lucky Penny",
                      description: "Shiny",
                      price: 1000,
                      image: "/images/Penny.png",)

    visit "/items"
    click_on "Add to Cart"
    click_on "Cart"
    visit "/cart_items"
  end

  scenario "they can add additional items to the cart" do
    within(".cart-items") do
      expect(page).to have_content("Lucky Penny")
      expect(page).to have_content("$10.00")
      expect(page).to have_content("Qty. 1")
    end

    within(".cart-container") do
      expect(page).to have_content("Total: $10.00")
    end

    click_on "Increase quantity"

    expect(current_path).to eq("/cart_items")

    within(".cart-items") do
      expect(page).to have_content("Lucky Penny")
      expect(page).to have_content("$20.00")
      expect(page).to have_content("Qty. 2")
    end

    within(".cart-container") do
      expect(page).to have_content("Total: $20.00")
    end
  end

  scenario "they can remove items from the cart" do
    visit "/items"
    click_on "Add to Cart"
    click_on "Cart"
    visit "/cart_items"

    click_on "Decrease quantity"

    expect(current_path).to eq(cart_items_path)

    within(".cart-items") do
      expect(page).to have_content("Lucky Penny")
      expect(page).to have_content("$10.00")
      expect(page).to have_content("Qty. 1")
    end

    within(".cart-container") do
      expect(page).to have_content("Total: $10.00")
    end
  end

  context "they decrease quantity to zero" do
    scenario "they see the item removed from the cart" do
      skip
    end
  end
end

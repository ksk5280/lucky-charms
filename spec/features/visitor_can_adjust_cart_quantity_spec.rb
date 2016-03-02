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
    # Background: My cart has an item in it
    #   As a visitor
    #   Then I should see my item with a quantity of 1

    within(".cart-items") do
      expect(page).to have_content("Lucky Penny")
      expect(page).to have_content("$10.00")
      expect(page).to have_content("Qty. 1")
    end

    within(".cart-container") do
      expect(page).to have_content("Total: $10.00")
    end

    #   And when I increase the quantity
    click_on "Increase quantity"
    #   Then my current page should be '/cart'
    expect(current_path).to eq(cart_items_path)
    #   And that item's quantity should reflect the increase
    #   And the subtotal for that item should increase
    within(".cart-items") do
      expect(page).to have_content("Lucky Penny")
      # expect(page).to have_content("$20.00")
      expect(page).to have_content("Qty. 2")
    end

    #   And the total for the cart should match that increase
    within(".cart-container") do
      expect(page).to have_content("Total: $20.00")
    end
  end

  scenario "they can remove items from the cart" do
    visit "/items"
    click_on "Add to Cart"
    click_on "Cart"
    visit "/cart_items"

    within(".cart-items") do
      expect(page).to have_content("Lucky Penny")
      # expect(page).to have_content("$20.00")
      expect(page).to have_content("Qty. 2")
    end

    within(".cart-container") do
      expect(page).to have_content("Total: $20.00")
    end
    #   And when I decrease the quantity
    click_on "Decrease quantity"
    #   Then my current page should be '/cart'
    expect(current_path).to eq(cart_items_path)
    #   And that item's quantity should reflect the decrease

    within(".cart-items") do
      expect(page).to have_content("Lucky Penny")
      # expect(page).to have_content("$10.00")
      expect(page).to have_content("Qty. 1")
    end
    #   And the subtotal for that item should decrease
    #   And the total for the cart should match that decrease
    within(".cart-container") do
      expect(page).to have_content("Total: $10.00")
    end
  end
end

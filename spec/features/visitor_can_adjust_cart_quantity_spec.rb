require "rails_helper"

RSpec.feature "Visitor can adjust cart quantity" do
  before(:each) do
    @item = create(:item)

    visit "/items"
    click_on "Add to Cart"
    click_link "Cart"
    visit "/cart"
  end

  scenario "they can add additional items to the cart" do
    within(".cart-items") do
      expect(page).to have_content @item.title
      expect(page).to have_content @item.price
      expect(page).to have_content("Qty. 1")
      expect(page).to have_content("Subtotal: $0.01")
    end

    within(".cart-container") do
      expect(page).to have_content("Total: $0.01")
    end

    click_on "Increase quantity"

    expect(current_path).to eq("/cart")

    within(".cart-items") do
      expect(page).to have_content @item.title
      expect(page).to have_content("Qty. 2")
      expect(page).to have_content("Subtotal: $0.02")
    end

    within(".cart-container") do
      expect(page).to have_content("Total: $0.02")
    end
  end

  scenario "they can remove items from the cart" do
    visit "/items"
    click_on "Add to Cart"
    click_link "Cart"
    visit "/cart"

    click_on "Decrease quantity"

    expect(current_path).to eq(cart_path)

    within(".cart-items") do
      expect(page).to have_content @item.title
      expect(page).to have_content @item.price
      expect(page).to have_content("Qty. 1")
    end

    within(".cart-container") do
      expect(page).to have_content("Total: $0.01")
    end
  end

  context "they decrease quantity to zero" do
    scenario "they see the item removed from the cart" do
      click_on "Decrease quantity"

      within(".cart-items") do
        expect(page).not_to have_content @item.title
        expect(page).not_to have_content @item.price
        expect(page).not_to have_content("Qty. 1")
        expect(page).not_to have_content("Subtotal: ")
      end

      within(".cart-container") do
        expect(page).to have_content("Total: $0.00")
      end
    end
  end
end

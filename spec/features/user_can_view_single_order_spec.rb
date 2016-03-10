require "rails_helper"

RSpec.feature "User can view a single order" do
  before(:each) do
    @user = create(:user)
    @order = @user.orders.create(status: "ordered",
                                 created_at: Time.new(2016, 3, 1))
    @item1 = create(:item)
    @item2 = create(:item)
    @line_item1 = @order.line_items.create(item: @item1, quantity: 2)
    @line_item2 = @order.line_items.create(item: @item2, quantity: 3)

    @user2 = create(:user, username: "johndoe")
    @order2 = @user2.orders.create(status: "ordered",
                                   created_at: Time.new(2016, 3, 5))
    @line_item3 = @order2.line_items.create(item: @item1, quantity: 6)

    visit root_path
    first(:link, "Login").click
    fill_in "Username", with: @user.username
    fill_in "Password", with: "password"
    click_on "Login to your account"
  end

  scenario "they see order details" do
    visit "/orders"
    within ".orders" do
      expect(page).to have_content "##{@order.id}"
      expect(page).to have_content "ordered"
      expect(page).to have_content "March 1, 2016"
    end

    click_link "##{@order.id}"
    within ".items" do
      expect(page).to have_content @item1.title
      expect(page).to have_content "Qty. #{@line_item1.quantity}"
      expect(page).to have_content "Subtotal: $0.02"
      expect(page).to have_content @item2.title
      expect(page).to have_content "Qty. #{@line_item2.quantity}"
      expect(page).to have_content "Subtotal: $0.03"
      expect(page).to have_link @item1.title
      expect(page).to have_link @item2.title
    end

    expect(page).to have_content "ordered"
    expect(page).to have_content "Total: $0.05"
    expect(page).to have_content "Submitted on: March 1, 2016"
  end

  context "the order was completed" do
    scenario "they see a timestamp" do
      @user.orders.find(@order.id).update(status: "completed",
                                          updated_at: Time.new(2016, 3, 3))
      visit "/orders"
      click_link "##{@order.id}"
      expect(page).to have_content "completed"
      expect(page).to have_content "Date Updated: March 3, 2016"
    end
  end

  context "items have been retired from store" do
    scenario "they do not see Add to Cart button on item show page" do
      @item1.update(retired: true)
      visit "/orders"
      click_link "##{@order.id}"
      click_link @item1.title

      expect(current_path).to eq(item_path(@item1.id))
      expect(page).to_not have_button "Add to Cart"
      expect(page).to have_content "Item has been retired"
    end
  end

  context "tries to access order not belonging to them" do
    scenario "user sees 404 page" do
      visit "/orders/#{@order2.id}"

      expect(page).to have_content("Out of Luck!")
    end
  end
end

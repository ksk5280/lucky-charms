require "rails_helper"

RSpec.feature "User can view a single order" do
  scenario "they see order details" do
    user = create(:user)
    order = user.orders.create(status: "ordered",
                                created_at: Time.new(2016, 3, 1))
    item1 = create(:item)
    item2 = create(:item)
    line_item1 = order.line_items.create(item: item1, quantity: 2)
    line_item2 = order.line_items.create(item: item2, quantity: 3)

    visit root_path
    first(:link, "Login").click
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_on "Login to your account"

    visit "/orders"
    within ".orders" do
      expect(page).to have_content "##{order.id}"
      expect(page).to have_content "ordered"
      expect(page).to have_content "March 1, 2016"
    end

    click_link "##{order.id}"
    within ".items" do
      expect(page).to have_content item1.title
      expect(page).to have_content "Qty. #{line_item1.quantity}"
      expect(page).to have_content "Subtotal: #{line_item1.subtotal}"
      expect(page).to have_content item2.title
      expect(page).to have_content "Qty. #{line_item2.quantity}"
      expect(page).to have_content "Subtotal: #{line_item2.subtotal}"
      expect(page).to have_link item1.title
      expect(page).to have_link item2.title
    end
    expect(page).to have_content "ordered"
    expect(page).to have_content "Total: $0.05"
    expect(page).to have_content "Date Submitted: March 1, 2016"
  end



    #sad path
#       If the order was completed or cancelled,
#       Then I should see a timestamp when the action took place
    # expect(page).to have_content
#       And if any of the items in the order were retired from the menu

#       Then they should still be able to access the item page
#       But they should not be able to add the item to their cart
end

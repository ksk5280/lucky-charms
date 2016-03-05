require "rails_helper"

RSpec.feature "User can view a single order" do
  scenario "they see order details" do
    # Background: An existing user that has one previous order
    user = create(:user)
    order1 = user.orders.create(status: "ordered",
                                created_at: Time.new(2016, 3, 1))
    item1 = create(:item)
    item2 = create(:item)
    line_item1 = order1.line_items.create(item: item1, quantity: 2)
    line_item2 = order1.line_items.create(item: item2, quantity: 3)
    #       As an authenticated user
    visit root_path
    first(:link, "Login").click
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_on "Login to your account"
    #       When I visit "/orders"
    visit "/orders"
#       Then I should see my past order
    within ".orders" do
      expect(page).to have_content "##{order1.id}"
      expect(page).to have_content "ordered"
      expect(page).to have_content "March 1, 2016"
    end
#       And I should see a link to view that order
#       And when I click that link
    click_link "##{order1.id}"
#       Then I should see each item that was order with the quantity and line-item subtotals
    within ".items" do
      expect(page).to have_content item1.title
      expect(page).to have_content "Quantity: #{line_item1.quantity}"
      expect(page).to have_content "Subtotal: #{line_item1.subtotal}"
      expect(page).to have_content item2.title
      expect(page).to have_content "Quantity: #{line_item2.quantity}"
      expect(page).to have_content "Subtotal: #{line_item2.subtotal}"
      #       And I should see links to each item's show page
      expect(page).to have_link "#{item1.title}"
      expect(page).to have_link "#{item2.title}"
    end
    # And I should see the current status of the order (ordered, paid, cancelled, completed)
    expect(page).to have_content order.status
    #       And I should see the total price for the order
    expect(page).to have_content order.total
#       And I should see the date/time that the order was submitted
    expect(page).to have_content order.formatted_date
  end



    #sad path
#       If the order was completed or cancelled,
#       Then I should see a timestamp when the action took place
    # expect(page).to have_content
#       And if any of the items in the order were retired from the menu

#       Then they should still be able to access the item page
#       But they should not be able to add the item to their cart
end

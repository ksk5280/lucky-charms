require "rails_helper"

RSpec.feature "admin views individual order details" do
  scenario "admin sees title, qty, price, subtotal" do
    User.create(username: "admin", password: "password", role: 1)
    user = User.create(username: "brennan",
                       password: "password",
                       first_name: "Brennan",
                       last_name: "Holtzclaw",
                       address: "1560 Blake St, Basement, Denver, CO 80202",)
    order_date = Time.new(2016, 3, 02, 2, 2, 30, "-07:00")
    order1 = user.orders.create(status: "paid",
                                created_at: order_date)
    item1 = create(:item)
    item2 = create(:item, price: 500)
    order1.line_items.create(item: item1, quantity: 5)
    order1.line_items.create(item: item2, quantity: 1)

    visit "/login"
    fill_in "Username", with: "admin"
    fill_in "Password", with: "password"
    click_on "Login to your account"

    visit admin_order_path(order1.id)

    expect(page).to have_content("Order ##{order1.id}")
    expect(page).to have_content("Submitted on: March 2, 2016 at 2:02 AM")
    expect(page).to have_content("Full Name: Brennan Holtzclaw")
    expect(page).to have_content("Address: #{user.address}")
    expect(page).to have_content("Status: paid")
    expect(page).to have_content("Total: $5.05")

    within ".items" do
      expect(page).to have_link item1.title
      expect(page).to have_content("Qty. 5")
      expect(page).to have_content("$0.01")
      expect(page).to have_content("Subtotal: $0.05")
      expect(page).to have_link item2.title
      expect(page).to have_content("Qty. 1")
      expect(page).to have_content("$5.00")
      expect(page).to have_content("Subtotal: $5.00")
    end
  end
end

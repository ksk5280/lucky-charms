require "rails_helper"

RSpec.feature "admin can view all orders" do
  before(:each) do
    User.create(username: "admin", password: "password", role: 1)
    user = create(:user)
    @order1 = user.orders.create(status: "ordered",
                                 created_at: Time.new(2016, 3, 1, 11, 25, 17))
    item1 = create(:item)
    item2 = create(:item, price: 765)
    line_item1 = @order1.line_items.create(item: item1, quantity: 2)
    line_item2 = @order1.line_items.create(item: item2, quantity: 3)

    @order2 = user.orders.create(status: "cancelled",
                                 created_at: Time.new(2016, 2, 13, 9, 15, 22))
    line_item3 = @order2.line_items.create(item: item1, quantity: 15)
    line_item4 = @order2.line_items.create(item: item2, quantity: 1)

    visit "/login"
    fill_in "Username", with: "admin"
    fill_in "Password", with: "password"
    click_on "Login to your account"
  end

  scenario "admin sees all orders and statuses" do
    visit admin_dashboard_index_path
    within ".orders" do
      expect(page).to have_content "##{@order1.id}"
      expect(page).to have_content "ordered"
      expect(page).to have_content "March 1, 2016"

      expect(page).to have_content "##{@order2.id}"
      expect(page).to have_content "cancelled"
      expect(page).to have_content "February 13, 2016"

      expect(page).to have_content("Ordered: 1")
      expect(page).to have_content("Paid: 0")
      expect(page).to have_content("Cancelled: 1")
      expect(page).to have_content("Completed: 0")
    end
  end

  scenario "admin filters by status" do
    visit admin_dashboard_index_path
    click_on "Ordered"

    within ".orders" do
      expect(page).to have_content "##{@order1.id}"
      expect(page).to have_content "ordered"
      expect(page).to have_content "March 1, 2016"

      expect(page).to_not have_content "##{@order2.id}"
      expect(page).to_not have_content "cancelled"
      expect(page).to_not have_content "February 13, 2016"
    end

    visit admin_dashboard_index_path
    click_on "Paid"

    within ".orders" do
      expect(page).to_not have_content "##{@order2.id}"
      expect(page).to_not have_content "cancelled"
      expect(page).to_not have_content "February 13, 2016"
    end

    visit admin_dashboard_index_path
    click_on "Cancelled"

    within ".orders" do
      expect(page).to have_content "##{@order2.id}"
      expect(page).to have_content "cancelled"
      expect(page).to have_content "February 13, 2016"

      expect(page).to_not have_content "##{@order1.id}"
      expect(page).to_not have_content "ordered"
      expect(page).to_not have_content "March 1, 2016"
    end
    visit admin_dashboard_index_path
    click_on "Completed"

    within ".orders" do
      expect(page).to_not have_content "##{@order2.id}"
      expect(page).to_not have_content "cancelled"
      expect(page).to_not have_content "February 13, 2016"
    end
  end

  scenario "admin tries to visit status path that does not exist" do
    visit "/admin/notathing"

    expect(page).to have_content "Status is invalid"
    within ".orders" do
      expect(page).to have_content "##{@order1.id}"
      expect(page).to have_content "ordered"
      expect(page).to have_content "March 1, 2016"

      expect(page).to have_content "##{@order2.id}"
      expect(page).to have_content "cancelled"
      expect(page).to have_content "February 13, 2016"

      expect(page).to have_content("Ordered: 1")
      expect(page).to have_content("Paid: 0")
      expect(page).to have_content("Cancelled: 1")
      expect(page).to have_content("Completed: 0")
    end
  end

  context "admin tries to change status of a single order" do
    scenario "sees invalid status notification and admin dashboard" do
      @order2.update(status: "completed")
      visit admin_dashboard_index_path

      click_on "Cancel order"
      expect(page).to have_content "Order ##{@order1.id} has been cancelled."
      within ".orders" do
        expect(page).to have_content "cancelled"
      end
    end

    scenario "admin can change status to cancel for orders that are paid" do
      @order2.update(status: "completed")
      @order1.update(status: "paid")
      visit admin_dashboard_index_path

      click_on "Cancel order"
      expect(page).to have_content "Order ##{@order1.id} has been cancelled."
      within ".orders" do
        expect(page).to have_content "cancelled"
      end
    end

    scenario "admin can change status to paid for orders that are ordered" do
      @order2.update(status: "completed")
      visit admin_dashboard_index_path

      click_on "Mark as paid"
      expect(page).to have_content "Order ##{@order1.id} has been paid."
      within ".orders" do
        expect(page).to have_content "paid"
      end
    end

    scenario "admin can change status to completed for orders that are paid" do
      @order1.update(status: "paid")
      visit admin_dashboard_index_path

      click_on "Mark as completed"
      expect(page).to have_content "Order ##{@order1.id} has been completed."
      within ".orders" do
        expect(page).to have_content "completed"
      end
    end
  end
end

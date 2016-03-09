require "rails_helper"

RSpec.feature "Admin can create items" do
  before(:each) do
    admin = create(:user, role: 1)
    @category = create(:category)
    @fixture_image_path = Rails.root.join("spec", "support", "lucky_test.png")

    visit "/login"
    fill_in "Username", with: admin.username
    fill_in "Password", with: "password"
    click_on "Login to your account"
  end

  scenario "they see item created" do
    click_on "Create New Item"
    fill_in "Title", with: "New Item"
    fill_in "Description", with: "New Description"
    fill_in "Price", with: "9.99"
    check(@category.title)
    attach_file "Image", @fixture_image_path
    click_on "Create Item"

    new_item = Item.last
    expect(current_path).to eq(item_path(new_item.id))
    expect(page).to have_content "#{new_item.title} has been created!"

    within ".item" do
      expect(page).to have_content new_item.title
      expect(page).to have_content new_item.description
      expect(page).to have_content new_item.formatted_price
      expect(page).to have_css("img[alt=\"#{new_item.title}\"]")
    end
  end

  context "admin tries to create an item without a title" do
    scenario "sees message that title is missing" do
      click_on "Create New Item"
      fill_in "Title", with: ""
      fill_in "Description", with: "New Description"
      fill_in "Price", with: "9.99"
      check(@category.title)
      attach_file "Image", @fixture_image_path
      click_on "Create Item"
      expect(page).to have_content "Title can't be blank"
    end
  end

  context "admin can create an item without an image" do
    scenario "sees default image for item" do
      click_on "Create New Item"
      fill_in "Title", with: "New Item"
      fill_in "Description", with: "New Description"
      fill_in "Price", with: "9.99"
      check(@category.title)
      click_on "Create Item"

      new_item = Item.last
      expect(current_path).to eq(item_path(new_item.id))
      expect(page).to have_content "#{new_item.title} has been created!"

      within ".item" do
        expect(page).to have_content new_item.title
        expect(page).to have_content new_item.description
        expect(page).to have_content new_item.formatted_price
        expect(page).to have_css("img[alt=\"#{new_item.title}\"]")
      end
    end
  end

  context "Non admin cannot create an item" do
    scenario "they are redirected to the items page" do
      click_on "Logout"
      visit "/items/new"

      expect(current_path).to eq(items_path)
    end
  end
end

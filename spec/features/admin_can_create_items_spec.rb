require "rails_helper"

RSpec.feature "Admin can create items" do
  before(:each) do
    admin = create(:user, role: 1)
    @category1 = create(:category)
    category2 = create(:category)
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
    find(:css, "#category-check-#{@category1.id}").click
    # upload image, optional
    click_on "Create Item"

    new_item = Item.last
    expect(current_path).to eq(item_path(new_item.id))
    expect(page).to have_content "#{new_item.title} has been created!"
    within ".item" do
      expect(page).to have_content new_item.title
      expect(page).to have_content new_item.description
      expect(page).to have_content new_item.formatted_price
      # expect(page).to have_content new_item.category
    end
  end

  context "they try to create an item without a title" do
    scenario "sees message that title is missing" do
      click_on "Create New Item"
      fill_in "Title", with: ""
      fill_in "Description", with: "New Description"
      fill_in "Price", with: "9.99"
      find(:css, "#category-check-#{@category1.id}").click
      # upload image, optional
      click_on "Create Item"

      expect(page).to have_content "Title can't be blank"
    end
  end
end

# As an authenticated Admin:
#     I can create an item.
#       - An item must have a title, description and price.
#       - An item must belong to at least one category.
#       - The title and description cannot be empty.
#       - The title must be unique for all items in the system.
#       - The price must be a valid decimal numeric value and greater than zero.
#       - The photo is optional. If not present, a stand-in photo is used. If desired the admin should be able to upload an image.

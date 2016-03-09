require "rails_helper"

RSpec.describe Category, type: :model do
  it { should validate_presence_of :title }
  it { should validate_uniqueness_of :title }
  it { should have_many(:items).through(:category_items) }
  it { should validate_presence_of :image }

  it "has a default value for image" do
    category = Category.create(title: "charms")
    expect(category.valid?).to eq(true)
    expect(category.image).to eq("default.png")
  end
end

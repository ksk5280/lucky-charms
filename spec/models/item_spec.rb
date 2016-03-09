require "rails_helper"

RSpec.describe Item, type: :model do
  it { should validate_presence_of :title }
  it { should validate_uniqueness_of(:title).case_insensitive }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price }
  it { should validate_numericality_of(:price).is_greater_than(0) }
  it { should validate_presence_of :categories }
  it { should have_many(:category_items) }
  it { should have_many(:categories).through(:category_items) }
  it { should have_many :line_items }
  it { should have_many(:orders).through(:line_items) }

  it "has a formatted price in dollars" do
    item1 = Item.create(title: "Lucky Penny",
                        description: "Shiny",
                        price: 1000,
                        image: File.new(Rails.root.join("spec",
                                                        "support",
                                                        "lucky_test.png")))

    expect(item1.formatted_price).to eq "$10.00"
  end
end

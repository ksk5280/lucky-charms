require "rails_helper"

RSpec.describe Item, type: :model do
  it { should validate_presence_of :title }
  it { should validate_uniqueness_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price }
  it { should validate_presence_of :image }
  it { should validate_numericality_of(:price).is_greater_than(0) }
  it { should have_many(:category_items) }
  it { should have_many(:categories).through(:category_items) }
  it { should have_many :line_items }
  it { should have_many(:orders).through(:line_items) }
end

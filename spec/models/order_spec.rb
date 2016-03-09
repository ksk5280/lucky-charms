require "rails_helper"

RSpec.describe Order, type: :model do
  it { should validate_presence_of :status }
  it { should belong_to :user }
  it { should have_many :line_items }
  it { should have_many(:items).through(:line_items) }
  it { should validate_inclusion_of(:status).in_array(Order.statuses) }

  it "has specific statuses" do
    expect(Order.statuses).to eq %w(ordered paid cancelled completed)
  end

  it "can determine its total price" do
    order1 = Order.create(status: "ordered")
    item1 = create(:item, price: 400)
    item2 = create(:item, title: "Lucky 2", price: 77)
    order1.line_items.create(item: item1, quantity: 35)
    order1.line_items.create(item: item2, quantity: 3)

    expect(order1.total).to eq 14_231
  end

  it "can determine how many orders of each status" do
    Order.create(status: "ordered")
    2.times { Order.create(status: "paid") }
    3.times { Order.create(status: "cancelled") }

    expect(Order.status_total("completed")).to eq 0
    expect(Order.status_total("ordered")).to eq 1
    expect(Order.status_total("paid")).to eq 2
    expect(Order.status_total("cancelled")).to eq 3
  end
end

require "rails_helper"

RSpec.describe Order, type: :model do
  it { should validate_presence_of :status }
  it { should belong_to :user }
  it { should have_many :line_items }
  it { should have_many(:items).through(:line_items) }
  statuses = %w(ordered paid cancelled completed)
  it { should validate_inclusion_of(:status).in_array(statuses) }

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

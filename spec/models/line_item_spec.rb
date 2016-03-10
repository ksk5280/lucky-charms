require "rails_helper"

RSpec.describe LineItem, type: :model do
  it { should belong_to :item }
  it { should belong_to :order }

  it "can calculate its associated subtotal" do
    item1 = create(:item, price: 400)
    line_item1 = LineItem.create(item: item1, quantity: 6)
    expect(line_item1.subtotal).to eq 2400
  end
end

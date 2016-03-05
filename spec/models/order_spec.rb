require "rails_helper"

RSpec.describe Order, type: :model do
  it { should validate_presence_of :status }
  it { should belong_to :user }
  it { should have_many :line_items }
  it { should have_many(:items).through(:line_items) }
  it { should validate_inclusion_of(:status).in_array(%w(ordered paid cancelled completed))}
end

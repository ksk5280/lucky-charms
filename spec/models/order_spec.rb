require "rails_helper"

RSpec.describe Order, type: :model do
  it { should validate_presence_of :status }
  it { should validate_presence_of :created_at }
  it { should belong_to :user }
end

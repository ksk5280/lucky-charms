require "rails_helper"

RSpec.describe User, type: :model do
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }
  it { should validate_presence_of :password }
  it { should have_many :orders }

  it "should not default to admin" do
    user = User.create(username: "brennan", password: "password")

    expect(user.admin?).to eq false
  end
end

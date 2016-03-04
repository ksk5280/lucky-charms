class Order < ActiveRecord::Base
  belongs_to :user
  validates :status, presence: true
  validates :created_at, presence: true
end

class Category < ActiveRecord::Base
  has_many :category_items
  has_many :items, through: :category_items
  validates :title, presence: true, uniqueness: true
end

class Item < ActiveRecord::Base
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items
  has_many :line_items
  has_many :orders, through: :line_items

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image, presence: true
end

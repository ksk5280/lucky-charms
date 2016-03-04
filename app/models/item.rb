class Item < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items
  has_many :line_items
  has_many :orders, through: :line_items

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image, presence: true

  def formatted_price
    number_to_currency(price.to_f / 100)
  end
end

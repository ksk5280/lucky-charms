require "open-uri"

class Item < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items
  has_many :line_items
  has_many :orders, through: :line_items

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  has_attached_file :image, default_url: "/images/horseshoe.png"
  validates_attachment :image,
                        content_type: {
                          content_type: [
                            "image/jpg",
                            "image/jpeg",
                            "image/png",
                            "image/gif"] }
  # validates :categories, presence: true
  #  An item must belong to at least one category.
  #  The title must be unique for all items in the system.

  def formatted_price
    number_to_currency(price.to_f / 100)
  end

  def picture_from_url(url)
    self.image = open(url)
  end
end

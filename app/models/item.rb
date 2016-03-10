class Item < ActiveRecord::Base
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items
  has_many :line_items, dependent: :destroy
  has_many :orders, through: :line_items

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  has_attached_file :image, default_url: "horseshoe.png"
  validates_attachment :image,
                       content_type: {
                         content_type: [
                           "image/jpg",
                           "image/jpeg",
                           "image/png",
                           "image/gif"] }
  validates :categories, presence: true

  def self.find_gold
    find_by(title: "Pot O' Gold").id
  end

  def self.find_sunshine
    find_by(title: "Four-Leaf Clover").id
  end

  def self.find_leprechaun
    find_by(title: "Uncatchable Leprechaun").id
  end
end

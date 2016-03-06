class Order < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  validates :status,
            presence: true,
            inclusion: {
              in: %w(ordered paid cancelled completed),
              message: "%{value} is not a valid status"
            }

  def formatted_creation_date
    created_at.strftime("%B %-d, %Y")
  end

  def formatted_update_date
    updated_at.strftime("%B %-d, %Y")
  end

  def formatted_time
    created_at.localtime.strftime("%-l:%M %p")
  end

  def total
    line_items.inject(0) do |total, line_item|
      total + line_item.subtotal
    end
  end

  def formatted_total
    number_to_currency(total)
  end
end

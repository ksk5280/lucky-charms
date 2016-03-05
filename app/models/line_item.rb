class LineItem < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  belongs_to :order
  belongs_to :item

  def subtotal
    (quantity * item.price).to_f / 100
  end

  def formatted_subtotal
    number_to_currency(subtotal)
  end
end

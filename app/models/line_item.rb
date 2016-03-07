class LineItem < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  belongs_to :order
  belongs_to :item

  def subtotal
    quantity * item.price
  end
end

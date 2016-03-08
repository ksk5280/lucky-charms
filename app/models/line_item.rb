class LineItem < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  belongs_to :order
  belongs_to :item

  before_save :set_subtotal

  def set_subtotal
    self.subtotal = item.price * quantity
  end
end

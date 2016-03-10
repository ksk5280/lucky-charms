module OrderGenerator
  def self.generate(cart, current_user)
    order = Order.new(status: "ordered")
    order.user = current_user
    cart.contents.each do |item, quantity|
      order.line_items.new(item_id: item.to_i, quantity: quantity)
    end
    order
  end
end

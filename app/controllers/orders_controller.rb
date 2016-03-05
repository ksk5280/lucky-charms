class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
    else
      redirect_to root_path
    end
  end

  def create
    @order = Order.new(status: "pending")
    @order.user = current_user
    @cart.contents.each do |item, quantity|
      @order.line_items << LineItem.new(item_id: item.to_i, quantity: quantity)
    end
    @order.save
    session[:cart] = {}
    flash[:success] = "Order was successfully placed!"
    redirect_to order_path(@order)
  end

  def show
    @order = Order.find(params[:id])
  end
end

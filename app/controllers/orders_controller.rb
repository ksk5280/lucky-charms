class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
    else
      redirect_to root_path
    end
  end

  def create
    @order = Order.new(status: "ordered")
    @order.user = current_user
    @cart.contents.each do |item, quantity|
      @order.line_items.new(item_id: item.to_i, quantity: quantity)
    end
    if @order.save
      session[:cart] = {}
      flash[:success] = "Order was successfully placed!"
      redirect_to order_path(@order.id)
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: params[:status])
    flash[:success] = "Order ##{@order.id} has been #{@order.status}."
    redirect_to admin_dashboard_index_path
  end
end

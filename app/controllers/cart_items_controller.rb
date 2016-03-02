class CartItemsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    status, message = @cart.update_quantity(params[:subtract], @item)
    flash[status] = message
    session[:cart] = @cart.contents
    redirect_to :back
  end

  def index
    @cart_contents = @cart.contents.map do |item_id, quantity|
      [Item.find(item_id.to_i), quantity]
    end
  end
end

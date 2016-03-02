class CartItemsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    if params[:subtract]
      @cart.remove_item(@item.id)
      flash[:danger] = "#{@item.title} removed from cart!"
    else
      @cart.add_item(@item.id)
      flash[:success] = "#{@item.title} added to cart!"
    end
    session[:cart] = @cart.contents
    redirect_to :back
  end

  def index
    @cart_contents = @cart.contents.map do |item_id, quantity|
      [Item.find(item_id.to_i), quantity]
    end
  end
end

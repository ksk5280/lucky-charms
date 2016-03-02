class CartItemsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents

    flash[:success] = "#{@item.title} added to cart!"

    redirect_to :back
  end

  def index
    @cart_contents = @cart.contents.map do |item_id, quantity|
      [Item.find(item_id.to_i), quantity]
    end
  end
end

class CartItemsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @cart.add_item(@item.id)
    session[:cart] = @cart.contents
    flash[:success] = "#{@item.title} added to cart!"
    redirect_to items_path
  end

  def index
    @cart_contents = @cart.contents.map do |item_id, quantity|
      [Item.find(item_id.to_i), quantity]
    end
  end

  def destroy
    @item = Item.find(params[:id])

    message = %[Successfully removed <a href="#{item_path(@item.id)}" class="alert-link">#{@item.title}</a> from your cart.]

    flash[:success] = message
    @cart.remove_item(@item.id)

    redirect_to cart_path
  end
end

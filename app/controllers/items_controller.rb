class ItemsController < ApplicationController
  def index
    @items = Item.where(retired: false)
  end

  def show
    @item = Item.find_by(id: params[:id])
    render file: "public/404" unless @item
  end
end

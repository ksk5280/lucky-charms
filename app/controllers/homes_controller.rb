class HomesController < ApplicationController
  def show
    @items = Item.take(3)
  end
end

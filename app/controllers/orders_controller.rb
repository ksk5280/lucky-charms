class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
    else
      redirect_to root_path
    end
  end
end

class HomesController < ApplicationController
  before_action :require_admin, only: [:index]
  def show
    @items = Item.take(3)
    @categories = Category.take(3)
  end

  def index
    if current_user.admin?
      session[:serious] = true
      flash[:success] = "IT'S ON NOW."
      redirect_to root_path
    else
      render file: "public/404"
    end
  end
end

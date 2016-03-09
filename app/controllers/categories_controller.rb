class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(title: params[:category])
    render file: "public/404" unless @category
  end

  def index
    @categories = Category.all
  end
end

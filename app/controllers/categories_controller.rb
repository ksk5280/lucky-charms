class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(title: params[:category])
    @items = @category.items
  end
end

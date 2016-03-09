class ItemsController < ApplicationController
  def index
    @items = Item.where(retired: false)
  end

  def show
    @item = Item.find_by(id: params[:id])
    render file: "public/404" unless @item
  end

  def new
    if current_admin?
      @item = Item.new
      @categories = Category.all
    else
      redirect_to items_path
    end
  end

  def create
    @item = Item.new(item_params)
    @item.categories = Category.all.select do |category|
      params[category.title] == "1"
    end
    if @item.save
      flash[:success] = "#{@item.title} has been created!"
      redirect_to item_path(@item.id)
    else
      @categories = Category.all
      flash.now[:danger] = @item.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image)
  end
end

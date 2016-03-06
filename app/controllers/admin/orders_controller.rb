class Admin::OrdersController < Admin::BaseController
  def show
    @order = Order.find(params[:id])
  end

  def index
    if Order.statuses.include?(params[:status])
      @orders = Order.where(status: params[:status]).order(id: :asc)
    else
      @orders = Order.all.order(id: :asc)
      flash.now[:error] = "Status is invalid"
      render "admin/dashboard/index"
    end
  end
end

class Admin::OrdersController < Admin::BaseController
  def show
    @order = Order.find(params[:id])
  end

  def index
    if Order.statuses.include?(params[:status])
      @orders = Order.where(status: params[:status]).order(id: :asc)
      @status = params[:status].capitalize
    elsif !params[:status]
      @orders = Order.all.order(id: :asc)
      @status = "All"
    else
      flash.now[:error] = "Status is invalid"
      @orders = Order.all.order(id: :asc)
      render "admin/dashboard/index"
    end
  end
end

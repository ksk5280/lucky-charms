class Admin::OrdersController < Admin::BaseController
  def show
    @order = Order.find(params[:id])
  end

  def index
    if Order.statuses.include?(params[:status])
      @orders = Order.where(status: params[:status]).order(updated_at: :desc)
      @status = params[:status].capitalize
    elsif !params[:status]
      @orders = Order.order(updated_at: :desc)
      @status = "All"
    else
      flash.now[:error] = "Status is invalid"
      @orders = Order.order(updated_at: :desc)
      render "admin/dashboard/index"
    end
  end
end

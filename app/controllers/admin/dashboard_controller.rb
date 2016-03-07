class Admin::DashboardController < Admin::BaseController
  def index
    @orders = Order.all.order(id: :asc)
  end
end

class Admin::DashboardController < Admin::BaseController
  def index
    @orders = Order.order(updated_at: :desc)
  end
end

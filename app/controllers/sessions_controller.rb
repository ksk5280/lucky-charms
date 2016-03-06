class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Logged in as #{@user.username}"
      session[:user_id] = @user.id
      if @user.admin?
        redirect_to admin_dashboard_index_path
      else
        redirect_to dashboard_path(id: @user.id)
      end
    else
      flash.now[:danger] = "Invalid. Try Again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end
end

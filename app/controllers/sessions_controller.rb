class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @user.admin?
        redirect_to admin_user_index_path
      else
        redirect_to dashboard_path(id: @user.id)
      end
    else
      flash.now[:danger] = "Invalid. Try Again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to "/"
  end
end

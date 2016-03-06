class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Logged in as #{@user.username}"
      redirect_to dashboard_path(id: @user.id)
    else
      flash[:danger] = "Invalid account details. Please try again."
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def edit
    if !current_user || current_user.id != params[:id].to_i
      render file: "public/404"
    end
    @user = current_user
  end

  def update
    current_user.update(user_params)
    if current_user.save
      flash[:success] = "Account successfully updated."
      redirect_to dashboard_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

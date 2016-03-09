class UsersController < ApplicationController
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
    user_is_current_user?
    @user = current_user
  end

  def edit
    user_is_current_user?
    @user = current_user
  end

  def update
    current_user.update(user_params)
    if current_user.save
      flash[:success] = "Account successfully updated."
      redirect_to dashboard_path(id: current_user.id)
    else
      @user = current_user
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                 :password,
                                 :first_name,
                                 :last_name,
                                 :address)
  end

  def user_is_current_user?
    if !current_user || current_user.id != params[:id].to_i
      render file: "public/404"
    end
  end
end

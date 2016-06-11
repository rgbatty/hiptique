class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:welcome] = "Thanks for creating an account!"
      redirect_to user_path(@user)
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = current_user
    if current_user.admin?
      redirect_to admin_dashboard_path
    else
      render :show
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

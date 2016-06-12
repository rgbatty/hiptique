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
      redirect_to dashboard_path#user_path(@user)
    else
      flash.now[:error] = @user.errors.full_messages[0]
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

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to dashboard_path
    else
      flash.now[:error] = @user.errors.full_messages[0]
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end

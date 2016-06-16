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
      #UserMailer.welcome_email(@user).deliver_now
      session[:user_id] = @user.id
      flash[:welcome] = "Thanks for creating an account!"
      redirect_to dashboard_path
    else
      flash.now[:error] = @user.errors.full_messages[0]
      render :new
    end
  end

  def show
    return redirect_to login_path if current_user.nil?

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
    params.require(:user).permit(:username, :password, :password_confirmation,
                                 :email, :email_confirmation, :name, :address,
                                 :city, :state, :zip)
  end
end

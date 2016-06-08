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
      flash[:welcome] = "Thanks for creating an account!"
      redirect_to user_path(@user)
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

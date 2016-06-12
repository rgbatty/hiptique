class SessionsController < ApplicationController
  after_filter "get_login_redirect", only: [:new]

  def new

  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if session[:login_redirect] == "/cart"
        redirect_to cart_path
      else
        redirect_to dashboard_path
      end 
    else
      flash.now[:error] = "Invalid login"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You are now logged out"
    redirect_to login_path
  end

  def get_login_redirect
    session[:login_redirect] = URI(request.referrer || '').path
  end

end

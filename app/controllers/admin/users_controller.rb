class Admin::UsersController < Admin::BaseController
  def show
    @user = current_user
    @orders = Order.all
  end
end

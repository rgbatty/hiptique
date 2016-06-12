class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end



  def create
    @order = Order.new(user_id: params[:user_id])
    if @order.save
      redirect_to orders_path
    else
      flash[:error] = "Could not checkout"
    end
  end

end

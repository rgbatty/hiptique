class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def create
    @order = current_user.orders.new(user_id: params[:user_id])
    if @order.save && session[:cart]
      @order.create_order_items(set_cart)
      flash[:notice] = "Order was successfully placed."
      session[:cart] = {}
      redirect_to orders_path
    else
      flash[:error] = "Could not checkout"
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end    
end

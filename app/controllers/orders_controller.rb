class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def create
    @order = current_user.orders.new(user_id: params[:user_id])
    if @order.save && session[:cart] != {}
      @order.create_order_items(set_cart)
      flash[:notice] = "Order was successfully placed."
      session[:cart] = {}
      redirect_to orders_path
    else
      flash[:error] = "Could not checkout. Please add some items!"
      redirect_to cart_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to @order
    else
      render :show
    end
  end

private
  def order_params
    params.require(:order).permit(:status)
  end
end

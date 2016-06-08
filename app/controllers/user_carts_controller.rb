class UserCartsController< ApplicationController
  def create
    @cart.add_item(params[:item_id])
    session[:cart] = @cart.contents
    redirect_to user_carts_path
  end

  def index
    @contents = @cart.obj_contents
  end
end

class UserCartsController< ApplicationController
  def create
    if params[:create]
      @cart.add_item(params[:item_id])
    else
      @cart.remove_item(params[:item_id])
    end

    session[:cart] = @cart.contents
    redirect_to user_carts_path
  end

  def index
    @cart
  end
end

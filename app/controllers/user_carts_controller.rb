class UserCartsController< ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    redirect_to :back
  end

  def new
  end

  def update
    item = Item.find(params[:item_id])
    @cart.update_quantity(item.id, params[:quantity]) if params[:quantity]
    session[:cart] = @cart.contents
    redirect_to user_carts_path
  end

  def destroy
    item = Item.find(params[:item_id])
    
      if params[:remove]
      @cart.remove_item(item.id)
      flash[:remove_item] = "Successfully removed #{view_context.link_to item.name, item_path(item)} from your cart."
    end
  end


  def index
    @cart
  end
end

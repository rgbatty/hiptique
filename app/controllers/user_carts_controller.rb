class UserCartsController< ApplicationController
  def create
    item = Item.find(params[:item_id])
    if params[:create]
      @cart.add_item(item.id)
    else
      @cart.remove_item(item.id)
      flash[:remove_item] = "Successfully removed #{view_context.link_to item.name, item_path(item)} from your cart."
    end

    session[:cart] = @cart.contents
    redirect_to :back
  end

  def index
    @cart
  end
end

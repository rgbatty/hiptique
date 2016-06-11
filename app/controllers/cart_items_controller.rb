class CartItemsController< ApplicationController
  def index
    @cart
  end

  def create
    item = Item.find(params[:id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    redirect_to :back
  end

  def update
    item = Item.find(params[:id])
    @cart.update_quantity(item.id, params[:quantity]) if params[:quantity]
    session[:cart] = @cart.contents
    redirect_to cart_items_path
  end

  def destroy
    item = Item.find(params[:id])
    @cart.remove_item(item.id)
    flash[:remove_item] = "Successfully removed #{view_context.link_to item.name, item_path(item)} from your cart."
    session[:cart] = @cart.contents
    redirect_to cart_items_path
  end
end

class UserCartsController< ApplicationController
  def create
    item = Item.find(params[:item_id])
    if params[:create]
      @cart.add_item(item.id)
    elsif params[:remove]
      @cart.remove_item(item.id)
      flash[:remove_item] = "Successfully removed #{view_context.link_to item.name, item_path(item)} from your cart."
    end

    @cart.update_quantity(item.id, params[:quantity]) if params[:quantity]

    session[:cart] = @cart.contents
    redirect_to :back
  end

  def index
    @cart
  end

  #could make update methods, etc; will change how our form works
  #refactor create method so that it's not doing all these things
end

class CartItem < SimpleDelegator
  attr_accessor :quantity, :subtotal

  def initialize(item, quantity, subtotal)
    super(item)
    @quantity = quantity
    @subtotal = subtotal
  end
end

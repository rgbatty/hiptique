class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  def create_order_items(cart)
    cart.obj_contents.each do |content|
      OrderItem.create(item_id: content.id, order_id: self.id)
    end
  end


end

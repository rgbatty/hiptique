class Order < ActiveRecord::Base
  attr_accessor :cart

  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  # after_save :create_order_items(cart)

  def create_order_items(cart)
    cart.obj_contents.each do |content|
      OrderItem.create(item_id: content.id, order_id: self.id, subtotal: content.subtotal, quantity: content.quantity)
    end
  end

  def total_price
    order_items.sum(:subtotal)
  end

  enum status:["ordered", "paid", "cancelled", "completed"]
end

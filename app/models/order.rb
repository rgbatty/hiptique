class Order < ActiveRecord::Base
  attr_accessor :cart

  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  enum status:["ordered", "paid", "cancelled", "completed"]

  def create_order_items(cart)
    cart.obj_contents.each do |content|
      OrderItem.create(item_id: content.id, order_id: self.id,
                       subtotal: content.subtotal, quantity: content.quantity)
    end
  end

  def cancel
    self.finished_at = DateTime.now
    self.update_attributes(status: "cancelled")
  end

  def complete
    self.finished_at = DateTime.now
    self.update_attributes(status:"completed")
  end

  def total_price
    order_items.sum(:subtotal)
  end

  def get_relevant_time
    if self.status == "completed" || self.status == "cancelled"
      self.finished_at
    else
      self.updated_at
    end
  end

  def self.total(status)
    where(status: status).size
  end

  def self.objects(status)
    where(status: status)
  end

  def editable_status?
    if ordered? || paid?
      true
    else
      false
    end
  end

  def status_options
    if ordered?
      ["ordered", "paid", "cancelled"]
    else paid?
      ["paid", "completed", "cancelled"]
    end
  end
end

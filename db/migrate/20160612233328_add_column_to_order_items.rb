class AddColumnToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :quantity, :string
    add_column :order_items, :subtotal, :decimal
  end
end

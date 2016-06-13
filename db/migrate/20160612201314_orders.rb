class Orders < ActiveRecord::Migration
  def change
    create_join_table :orders, :items, table_name: :order_items do |t|
      t.index :order_id
      t.index :item_id
    end
  end
end

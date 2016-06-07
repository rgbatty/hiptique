class AddReferenceItems < ActiveRecord::Migration
  def change
    create_join_table :items, :categories do |t|
    end
  end
end

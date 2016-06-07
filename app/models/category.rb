class Category < ActiveRecord::Base
  has_many :categories_items
  has_many :items, through: :categories_items

  validates :name, presence:true, uniqueness: true
end

class Item < ActiveRecord::Base
  has_many :categories_items
  has_many :categories, through: :categories_items

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end

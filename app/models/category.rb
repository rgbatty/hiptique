class Category < ActiveRecord::Base
  has_many :categories_items
  has_many :items, through: :categories_items

  validates_format_of :name, :without => /\A\d/
  validates :name, presence:true, uniqueness: true

  def slug
    name.parameterize
  end

  def to_param
    slug
  end

  def self.find(input)
    if input.to_i == 0
      find_by_name(input)
    else
      super
    end
    #make sure we test for this edge case 
  end
end

class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  validates :username, presence: :true, uniqueness: :true

  enum role:["default", "admin"]

  def to_param

  end

end

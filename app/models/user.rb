class User < ActiveRecord::Base
  has_many :orders

  validates :username, presence: :true, uniqueness: :truev
  validates :password, presence: :true

  has_secure_password validations: false
  validates_confirmation_of :password, :message => "does not match"

  enum role:["default", "admin"]

  def to_param

  end

end

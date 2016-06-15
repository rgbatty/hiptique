class User < ActiveRecord::Base
  has_many :orders

  validates :username, presence: :true, uniqueness: :true
  validates :password, presence: :true
  validates :email, presence: :true
  validates :name, presence: :true
  validates :address, presence: :true
  validates :city, presence: :true
  validates :state, presence: :true
  validates :zip, presence: :true

  has_secure_password validations: false
  validates_confirmation_of :password, :message => "does not match"
  validates_confirmation_of :email, :message => "does not match"


  enum role:["default", "admin"]

  def to_param
  end

end

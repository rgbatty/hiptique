class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: :true, uniqueness: :true

  def to_param
    
  end

end

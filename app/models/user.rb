class User < ActiveRecord::Base
  validates :user_name, presence:true
  has_secure_password
end

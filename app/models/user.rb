class User < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 32}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
end

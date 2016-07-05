class User < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 32}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
  has_many :products

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ?
      BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def product_list
    Product.where("user_id not ?", nil)
  end
end

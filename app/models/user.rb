class User < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 32}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
  has_many :products
  has_many :bids

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ?
      BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def product_item
    Product.where.not(id: nil)
  end
end

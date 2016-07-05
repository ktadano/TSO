class Bid < ActiveRecord::Base
  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :current_bid, presence: true, length: { maximum: 8 }
  belongs_to :user
  belongs_to :product

  def greater_price?
    current_bid > product.current_bid
  end
end

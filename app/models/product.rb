class Product < ActiveRecord::Base
  belongs_to :user
  has_many :bids
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 64 }
  validates :current_bid, presence: true, length: { maximum: 8 }
  validates :discription, presence: true, length: { maximum: 128 }
  validates :time_left, presence: true
end

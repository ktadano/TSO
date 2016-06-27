class Product < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 64 }
  validates :current_bit, presence: true
  validates :time_left, presence: true
end

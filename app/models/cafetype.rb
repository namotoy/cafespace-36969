class Cafetype < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  validates :image,:shop_name, :catch_copy,:city,:block_number, presence: true
  validates :cafe_price, numericality:{ with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
  validates :cafe_price,
  numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 9999, only_integer: true,
                  message: 'out of setting range' }
  validates :prefecture_id,:wifi, :power_supply, :capacity, :toilet_place, :cafe_price, numericality:{ other_than: 0, message: "can't be blank" }
end

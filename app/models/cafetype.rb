class Cafetype < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :prefecture
  belongs_to :wifi
  belongs_to :power_supply
  belongs_to :capacity
  belongs_to :toilet_place
  has_many :comments
  validates :image,:shop_name, :catch_copy,:city,:block_number, presence: true
  validates :prefecture_id,:wifi_id, :power_supply_id, :capacity_id, :toilet_place_id, :cafe_price, numericality:{ other_than: 0, message: "を入力してください " }
  validates :cafe_price, numericality:{ with: /\A[0-9]+\z/, message: 'が無効です。半角文字で入力してください' }
  validates :cafe_price,
  numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 9999, only_integer: true,
                  message: 'が設定範囲外です' }

  def self.search(search)
    if search != ""
      Cafetype.where('shop_name LIKE(?)', "%#{search}%")
    else
      Cafetype.all
    end
  end
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end

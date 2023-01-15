class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  ##自分用メモ：空の投稿を保存できないようにする
  validates :name, :content, presence: true

  validates :price,             numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  ##自分用メモ：カテゴリーの選択が「---」の時は保存できないようにする
  validates :category_id,       numericality: { other_than: 1 }
  validates :status_id,         numericality: { other_than: 1 }
  validates :postage_id,        numericality: { other_than: 1 }
  validates :sender_address_id, numericality: { other_than: 1 }
  validates :day_to_ship_id,    numericality: { other_than: 1 }

  ##自分用メモ：アソシエーション
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :sender_address
  belongs_to :day_to_ship
  belongs_to :user
  

end

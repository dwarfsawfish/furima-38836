class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  ##空の投稿を保存できないようにする
  validates :name, :content, :price, presence: true

  ##カテゴリーの選択が「---」の時は保存できないようにする
  validates :category_id,       numericality: { other_than: 1 }
  validates :status_id,         numericality: { other_than: 1 }
  validates :postage_id,        numericality: { other_than: 1 }
  validates :sender_address_id, numericality: { other_than: 1 }
  validates :day_to_ship_id,    numericality: { other_than: 1 }

  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :sender_address
  belongs_to :day_to_ship
  belongs_to :user
  

end

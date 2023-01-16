class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name, :content, :image, presence: true

  validates :price,             presence: true, numericality: { with: /\A[0-9]+\z/, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id,       numericality: { other_than: 1, message: 'カテゴリーを選択してください'}
  validates :status_id,         numericality: { other_than: 1, message: '商品の状態を選択してください' }
  validates :postage_id,        numericality: { other_than: 1, message: '配送料を選択してください' }
  validates :sender_address_id, numericality: { other_than: 1, message: '発送元の地域を選択してください' }
  validates :day_to_ship_id,    numericality: { other_than: 1, message: '発送までの日数を選択してください' }

  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :sender_address
  belongs_to :day_to_ship
  belongs_to :user
  has_one_attached :image  

end

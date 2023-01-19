class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :sender_address_id, :phone_number,
                :municipality, :address, :building, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid' }
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :municipality
    validates :address
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :sender_address_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, phone_number: phone_number, sender_address_id: sender_address_id,
                           municipality: municipality, address: address, building: building, order_id: order.id)
  end
end

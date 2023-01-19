class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string        :postal_code,          null: false
      t.string        :phone_number,         null: false
      t.integer       :sender_address_id,    null: false
      t.string        :municipality,         null: false
      t.string        :address,              null: false
      t.references    :order,                null: false, foreign_key: true
      t.string        :building          
      t.timestamps
    end
  end
end

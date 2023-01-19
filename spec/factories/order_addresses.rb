FactoryBot.define do
  factory :order_address do
    postal_code           { '333-3333' }
    phone_number          { '09011112222' }
    sender_address_id     { 2 }
    municipality          { '世田谷区' }
    address               { '５番地' }
    building              { 'Aビル' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

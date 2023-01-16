FactoryBot.define do
  factory :item do
    name               { "シャツ" }
    content            { Faker::Lorem.sentence }
    price              { 1000 }
    category_id        { 2 }
    status_id          { 2 }
    postage_id         { 2 }
    sender_address_id  { 2 }
    day_to_ship_id     { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

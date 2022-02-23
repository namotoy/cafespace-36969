FactoryBot.define do
  factory :cafetype do
    shop_name          { Faker::Lorem.sentence }
    catch_copy         { Faker::Lorem.sentence }
    prefecture_id      { '1' }
    city               { Faker::Lorem.sentence }
    block_number       { Faker::Lorem.sentence }
    wifi               { '1' }
    power_supply       { '1' }
    capacity           { '1' }
    toilet_place       { '1' }
    cafe_price         { '3333' }
    association :user

    after(:build) do |cafetype|
      cafetype.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

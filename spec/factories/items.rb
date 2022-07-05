FactoryBot.define do
  factory :item do

    name {Faker::Internet.name}
    profile {Faker::Lorem.characters(number: 100, min_alpha: 1, min_numeric: 1)}
    category_id {Faker::Number.between(from: 2, to: 10)}
    state_id {Faker::Number.between(from: 2, to: 7)}
    delivery_id {Faker::Number.between(from: 2, to: 3)}
    region_id {Faker::Number.between(from: 2, to: 48)}
    time_count_id {Faker::Number.between(from: 2, to: 4)}
    price {Faker::Number.between(from: 2, to: 9999999)}
    association :user 

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

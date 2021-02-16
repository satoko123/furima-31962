FactoryBot.define do
  factory :item do
    item_name               { "サンプル商品" }
    item_text               { "サンプル商品の説明" }
    price                   { 300 }
    category_id             { 2 }
    item_state_id           { 2 }
    paying_for_shipping_id  { 2 }
    shipping_area_id        { 2 }
    shipping_day_id         { 2 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

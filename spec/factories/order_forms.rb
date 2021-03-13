FactoryBot.define do
  factory :order_form do
    postal_code { '000-0000' }
    region_id { 2 }
    city { '横山市緑区' }
    street_address { '青山1-1-1' }
    building { 'ビル1' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end

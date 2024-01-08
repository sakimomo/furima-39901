FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    street_address { '1-1' }
    building_name { 'ハイツ' }
    phone_number { '01234567890' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
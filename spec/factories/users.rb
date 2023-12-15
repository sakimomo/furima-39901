FactoryBot.define do
  factory :user do
    name { 'a' }
    email { Faker::Internet.email }
    last_name { 'あ' }
    first_name { 'あ' }
    last_name_kana { 'ア' }
    first_name_kana { 'ア' }
    birthday { Date.new(1990, 1, 1) }
    password { 'aaa111' }
    password_confirmation { password }
  end
end

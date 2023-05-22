FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Name.name }
    password { Faker::Alphanumeric.alpha(number: 10) }
  end
end

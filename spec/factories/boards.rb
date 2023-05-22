FactoryBot.define do
  factory :board do
    name { Faker::Movie.title }
  end
end

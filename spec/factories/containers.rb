FactoryBot.define do
  factory :container do
    title { Faker::Movies::StarWars.character }
    board
  end
end

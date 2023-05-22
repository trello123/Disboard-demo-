FactoryBot.define do
  factory :card do
    title { Faker::Movies::HarryPotter.character }
    intro { Faker::Movies::StarWars.wookiee_sentence }
    level { 1 }
    daybegin { Faker::Time.backward(days: 60, period: :evening, format: :short) }
    deadline { Faker::Time.backward(days: 30, period: :morning, format: :short) }
    position { Faker::Number.between(from: 1, to: 10) }
    assigned_to { '尚未指派' }
    board
    container 
  end
end

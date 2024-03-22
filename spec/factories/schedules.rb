FactoryBot.define do
  factory :schedule do
    event { Faker::Lorem.sentence(word_count: 3) }
    start_time { Faker::Time.between(from: DateTime.now, to: DateTime.now + 5) }
    end_time   { Faker::Time.between(from: start_time, to: start_time + 5) }
    association :family
    association :user
  end
end
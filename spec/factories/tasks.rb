FactoryBot.define do
  factory :task do
    content { Faker::Lorem.sentence(word_count: 3) }
    category_id { Faker::Number.between(from: 2, to: 12) }
    association :family
  end
end

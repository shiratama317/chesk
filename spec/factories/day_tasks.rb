FactoryBot.define do
  factory :day_task do
    action_day { Faker::Date.between(from: Date.today, to: 1.year.from_now) }
    association :task
    association :user
    association :family
  end
end

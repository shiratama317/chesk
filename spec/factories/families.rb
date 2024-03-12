FactoryBot.define do
  factory :family do
    name { Faker::Name.first_name }
  end
end
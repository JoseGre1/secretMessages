FactoryBot.define do
  factory :search do
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude
    radius Faker::Number.between(0.0, 30_000.0)
  end
end

FactoryBot.define do
  factory :message do
    body Faker::Lorem.sentence.truncate(Faker::Number.between(1, 100), omission: "")
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude
  end
end

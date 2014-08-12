FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    description Faker::Lorem.sentence
    email Faker::Internet.email
  end
end
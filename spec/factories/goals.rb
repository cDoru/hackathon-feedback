FactoryGirl.define do
  factory :goal do
    title Faker::Hipster.sentence
    description Faker::Yoda.quote
    association :owner, factory: :user
  end
end

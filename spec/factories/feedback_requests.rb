FactoryGirl.define do
  factory :feedback_request do
    title Faker::Hipster.sentence
    description Faker::Yoda.quote
    association :requester, factory: :user
  end
end

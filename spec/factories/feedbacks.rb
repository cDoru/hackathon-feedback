FactoryGirl.define do
  factory :feedback do
    description { Faker::Lorem.paragraph }
    rating 1
    association :author, factory: :user
    association :subject, factory: :user
  end
end

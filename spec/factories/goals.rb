FactoryGirl.define do
  factory :goal do
    title { Faker::Hipster.sentence }
    description { Faker::Hipster.paragraph }
    association :owner, factory: :user
  end
end

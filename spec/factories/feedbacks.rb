FactoryGirl.define do
  factory :feedback do
    description "MyText"
    rating 1
    association :author, factory: :user
    association :subject, factory: :user
  end
end

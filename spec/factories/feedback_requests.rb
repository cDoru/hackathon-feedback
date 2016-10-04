FactoryGirl.define do
  factory :feedback_request do
    title "MyString"
    description "MyText"
    association :requester, factory: :user
  end
end

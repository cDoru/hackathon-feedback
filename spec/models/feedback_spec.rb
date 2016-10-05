require 'rails_helper'

RSpec.describe Feedback, type: :model do

  before do
    goal = FactoryGirl.create(:goal)
    feedback_requests_with_goal = FactoryGirl.create(:feedback_request, goal: goal)
    @feedback_with_request_and_goal = FactoryGirl.create(:feedback, feedback_request: feedback_requests_with_goal, goal: goal)

    feedback_requests = FactoryGirl.create(:feedback_request)
    @feedback_with_request = FactoryGirl.create(:feedback, feedback_request: feedback_requests)

    @feedback_with_goal = FactoryGirl.create(:feedback, goal: goal)

    @feedback = FactoryGirl.create(:feedback)
  end

  it 'Requested Goal Feedback' do
    expect(@feedback_with_request_and_goal.type).to eq "Requested Goal feedback"
  end

  it 'Requested Feedback' do
    expect(@feedback_with_request.type).to eq "Requested feedback"
  end

  it 'Goal Feedback' do
    expect(@feedback_with_goal.type).to eq "Goal feedback"
  end

  it 'Unsolicited Feedback' do
    expect(@feedback.type).to eq "Unsolicited feedback"
  end
end

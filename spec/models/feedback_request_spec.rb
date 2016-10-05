require 'rails_helper'

RSpec.describe FeedbackRequest, type: :model do
  let (:feedback_request) {FactoryGirl.create(:feedback_request)}

  before do
    @users = 3.times.map {FactoryGirl.create(:user)}
    FactoryGirl.create(:feedback, author: @users.first, feedback_request: feedback_request)
    @users.each do |user|
      feedback_request.invitees << user
    end
  end

  it 'User has already given the requested feedback' do
    expect(feedback_request.is_pending?(@users.first)).to eq false
  end

  it 'User has not given the requested feedback yet' do
    expect(feedback_request.is_pending?(@users[2])).to eq true
  end

  it 'Feedback Pending' do
    expect(feedback_request.pending_requests.count).to eq 2
  end

  it 'Completion Percentage' do
    expect(feedback_request.completion_percentage).to eq 1/3
  end
end




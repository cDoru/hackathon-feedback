require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) {FactoryGirl.create(:user)}

  before do
    @feedback_requests = 3.times.map {FactoryGirl.create(:feedback_request)}
    @feedback_requests.each do |request|
      request.invitees << user
    end
    FactoryGirl.create(:feedback, author: user, feedback_request: @feedback_requests.first)
    @other_user = FactoryGirl.create(:user)
    2.times {FactoryGirl.create(:feedback, author: user, subject: @other_user)}
    4.times {FactoryGirl.create(:feedback, author: @other_user, subject: user)}
  end

  it 'Feedback Pending' do
    expect(user.pending_requests.count).to eq 2
  end

  it 'Given Feedback' do
    expect(user.given_feedback.count).to eq 3
  end

  it 'Received Feedback' do
    expect(user.received_feedback.count).to eq 4
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) {FactoryGirl.create(:user)}

  before do
    @feedback_requests = 3.times.map {FactoryGirl.create(:feedback_request)}
    @feedback_requests.each do |request|
      request.invitees << user
    end
    FactoryGirl.create(:feedback, author: user, feedback_request: @feedback_requests.first)
  end

  it 'Feedback Pending' do
    expect(user.pending_requests.count).to eq 2
  end
end

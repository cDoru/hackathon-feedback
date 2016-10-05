class DashboardController < ApplicationController
  def index
    @user = current_user
    @last_request = @user.requested_feedback.last
  end
end

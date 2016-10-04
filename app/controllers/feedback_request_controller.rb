class FeedbackRequestController < ApplicationController
  def create
    #params.permit(:invitees)
    invitees = params[:invitees]

    @feedback_request = FeedbackRequest.create!(requester: current_user)
    invitees.each do |invitee|
      @feedback_request.invitees << User.find_by(id: invitee)
    end

  end

  def new
    @users = User.where.not(id: current_user.id)
  end

  def show
  end
end

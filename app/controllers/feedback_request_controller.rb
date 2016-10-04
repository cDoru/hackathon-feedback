class FeedbackRequestController < ApplicationController
  def create
    #params.permit(:invitees, :goal_id)
    invitees = params[:invitees]
    goal = Goal.find_by(id: params[:goal_id])
    title  = params[:title]
    description  = params[:description]

    @feedback_request = FeedbackRequest.create!(title: title, description: description, requester: current_user, goal: goal)
    invitees.each do |invitee|
      @feedback_request.invitees << User.find_by(id: invitee)
    end

  end

  def new
    @users = User.where.not(id: current_user.id)
    @goal = Goal.find_by(id: params[:goal_id])
  end
end

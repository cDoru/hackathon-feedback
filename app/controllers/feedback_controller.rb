class FeedbackController < ApplicationController
  def new
    @subject, @goal, @feedback_request = select_subject_goal_request(params[:user_id], params[:goal_id], params[:feedback_request_id])
  end

  def create
    #params.permit(:rating, :description, :subject_id, :goal_id, :feedback_request_id)

    rating = params[:rating]
    description  = params[:description]

    @subject, goal, @feedback_request = select_subject_goal_request(params[:subject_id], params[:goal_id], params[:feedback_request_id])

    @feedback = Feedback.create!(rating: rating, description: description, subject: @subject, author: current_user, feedback_request: @feedback_request, goal: goal)
  end

  def show
    @feedback = Feedback.find_by(id: params[:id])
  end

  private

  def select_subject_goal_request (subject_id, goal_id, feedback_request_id)
    subject = User.find_by(id: subject_id)

    if goal = Goal.find_by(id: goal_id)
      subject = goal.owner
    end

    if feedback_request = FeedbackRequest.find_by(id: feedback_request_id)
      goal = feedback_request.goal
      subject = feedback_request.requester
    end

    return subject, goal, feedback_request
  end
end

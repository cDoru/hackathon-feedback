class FeedbackController < ApplicationController
  def new
    @feedback_request = FeedbackRequest.find_by(id: params[:feedback_request_id])
    @goal = Goal.find_by(id:params[:goal_id])
    @subject = User.find_by(id: params[:user_id])
    if(@feedback_request)
      @subject = @feedback_request.requester
      if @feedback_request.goal
        @goal = @feedback_request.goal
      end
    elsif @goal
      @subject = @goal.owner
    end

  end

  def create

    #params.permit(:rating, :description, :subject_id, :goal_id, :feedback_request_id)

    rating = params[:rating]
    description  = params[:description]
    @feedback_request = FeedbackRequest.find_by(id: params[:feedback_request_id])
    goal = Goal.find_by(id:params[:goal_id])
    @subject = User.find_by(id: params[:subject_id])


    if @feedback_request
      if @feedback_request.goal
        goal = @feedback_request.goal
      end
      @subject = @feedback_request.requester
    elsif goal
      @subject = goal.owner
    end

    @feedback = Feedback.create!(rating: rating, description: description, subject: @subject, author: current_user, feedback_request: @feedback_request, goal: goal)
  end

  def show
    @feedback = Feedback.find_by(id: params[:id])
  end
end

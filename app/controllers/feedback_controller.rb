class FeedbackController < ApplicationController
  def new
    @subject = User.find_by(id: params[:user_id])
    @feedback_request = FeedbackRequest.find_by(id: params[:feedback_request_id])
  end

  def create

    #params.permit(:rating, :description, :subject_id)

    rating = params[:rating]
    subject_id = params[:subject_id]
    request_id  = params[:feedback_request_id]
    description  = params[:description]

    @subject = User.find_by(id: subject_id)
    @feedback_request = FeedbackRequest.find_by(id: request_id)
    @feedback = Feedback.create!(rating: rating, description: description, subject: @subject, author: current_user, feedback_request: @feedback_request)
  end

  def show
    @feedback = Feedback.find_by(id: params[:id])
  end
end

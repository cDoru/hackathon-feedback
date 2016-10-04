class FeedbackController < ApplicationController
  def new
    @subject = User.find_by(id: params[:user_id])
  end

  def create

    #params.permit(:rating, :description, :subject_id)

    rating = params[:rating]
    description = params[:description]
    subject_id = params[:subject_id]

    @subject = User.find_by(id: subject_id)

    @feedback = Feedback.create!(rating: rating, description: description, subject: @subject, author: current_user)
  end

  def show
    @feedback = Feedback.find_by(id: params[:id])
  end
end

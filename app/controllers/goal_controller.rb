class GoalController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id]) || current_user
    @goals = user.goals.order('created_at DESC')
  end

  def create
    title = params[:title]
    description = params[:description]

    @goal = Goal.create(title: title, description: description, owner: current_user)

    redirect_to action: :index
  end

  def new
  end
end

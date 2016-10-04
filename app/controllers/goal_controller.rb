class GoalController < ApplicationController
  def index
  end

  def create
    title = params[:title]
    description = params[:description]

    @goal = Goal.create(title: title, description: description, owner: current_user)
  end

  def new
  end
end

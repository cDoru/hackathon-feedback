class UsersController < ApplicationController
  def search
    search_query = params[:q]

    @list = User.where('name like ?', "%#{search_query}%")
  end

  def show
    #add error handling
    @user = User.find_by(id: params[:id])
  end

  def show_feedback
    @user = current_user
  end
end

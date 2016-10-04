class UsersController < ApplicationController
  def search
    search_query = params[:q]

    @list = User.where('name like ?', "%#{search_query}%")
  end
end

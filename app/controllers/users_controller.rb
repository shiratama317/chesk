class UsersController < ApplicationController
  def show
    user = User.find(current_user.id)
    @families = user.families
  end
end

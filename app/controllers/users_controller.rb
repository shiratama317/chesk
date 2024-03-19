class UsersController < ApplicationController
  def show
    user = User.find(current_user.id)
    @families = user.families
  end

  def destroy
    @user = User.find(current_user.id)
    if @user.destroy
      redirect_to root_path
    else
      redirect_to root_path, danger: '退会できませんでした'
    end
  end
end

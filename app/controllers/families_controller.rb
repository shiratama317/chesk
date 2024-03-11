class FamiliesController < ApplicationController
  def top
  end

  def new
    @family = current_user.families.build
  end

  private
  def family_params
    params.require(:family).permit(:name)
  end
end

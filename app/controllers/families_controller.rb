class FamiliesController < ApplicationController
  def top
  end

  def new
    @family = current_user.families.build
  end

  def create
    @family = Family.new(family_params)
    @family.users << current_user
    if @family.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def family_params
    params.require(:family).permit(:name)
  end
end

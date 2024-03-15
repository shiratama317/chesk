class DayTasksController < ApplicationController
  def new
    @family = Family.find(params[:family_id])
  end
end

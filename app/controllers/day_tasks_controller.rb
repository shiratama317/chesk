class DayTasksController < ApplicationController
  def new
    @family = Family.find(params[:family_id])
    @day_task = DayTask.new
    @tasks = @family.tasks
    @users = @family.users
  end

  def create
    @day_task = DayTask.new
  end
end

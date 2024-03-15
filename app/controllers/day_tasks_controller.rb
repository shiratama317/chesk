class DayTasksController < ApplicationController
  before_action :day_task_new, only: [:new, :create]

  def new
    @day_task = DayTask.new
  end

  def create
    @day_task = DayTask.new(day_task_params)
    if @day_task.save
      redirect_to new_family_day_task_path(params[:family_id]), success: '設定しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def day_task_new
    @family = Family.find(params[:family_id])
    @tasks = @family.tasks
    @users = @family.users
  end

  def day_task_params
    params.require(:day_task).permit(:start_time, :task_id, :user_id).merge(family_id: params[:family_id])
  end
end

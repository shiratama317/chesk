class DayTasksController < ApplicationController
  before_action :day_task_new, only: [:new, :create]
  before_action :day_task_update, only: [:edit, :update]

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

  def index
    @family = Family.find(params[:family_id])
    @day_tasks = DayTask.where(start_time: Date.today, user_id: current_user.id, family_id: @family.id)
  end

  def show
    @day_task = DayTask.find(params[:id])
    @family = @day_task.family
    @task = @day_task.task
    @category = @task.category
  end

  def edit
  end

  def update
    if params[:day_task][:origin] == "edit"
      if @day_task.update(day_task_params)
        redirect_to day_task_path(@day_task.id), success: "変更しました"
      else
        flash.now[:danger] = "変更できませんでした"
        render :edit, status: :unprocessable_entity
      end
    else
      unless @day_task.update(day_task_params)
        flash[:danger] = "変更できませんでした"
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def destroy
    day_task = DayTask.find(params[:id])
    family = day_task.family
    if day_task.destroy
      redirect_to family_tasks_path(family.id)
    else
      flash.now[:danger] = "変更できませんでした"
      render :show
    end
  end

  private
  def day_task_update
    @family = Family.find(params[:family_id])
    @day_task = DayTask.find(params[:id])
  end

  def day_task_new
    @family = Family.find(params[:family_id])
    @tasks = @family.tasks
    @users = @family.users
  end

  def day_task_params
    params.require(:day_task).permit(:start_time, :task_id, :user_id, :completed, :origin).merge(family_id: params[:family_id])
  end
end

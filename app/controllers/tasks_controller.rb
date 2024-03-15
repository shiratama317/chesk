class TasksController < ApplicationController
  before_action :task_index, only: [:new, :create]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to new_family_task_path(params[:family_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @family = Family.find(params[:family_id])
    @day_tasks = @family.day_tasks
  end

  private

  def task_index
    @family = Family.find(params[:family_id])
    @tasks = @family.tasks
    @categories = Category.all
  end

  def task_params
    params.require(:task).permit(:content, :category_id).merge(family_id: params[:family_id])
  end
end

class TasksController < ApplicationController
  before_action :task_index, only: [:new, :create]
  before_action :task_update, only: [:edit, :update]

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

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to new_family_task_path(@family.id), success: "変更しました"
    else
      flash.now[:danger] = "変更できませんでした"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    task = Task.find(params[:id])
    family = task.family
    if task.destroy
      redirect_to new_family_task_path(family.id)
    else
      flash.now[:danger] = "削除できませんでした"
      render :new
    end
  end

  private

  def task_update
    @task = Task.find(params[:id])
    @family = @task.family
  end

  def task_index
    @family = Family.find(params[:family_id])
    @tasks = @family.tasks
    @categories = Category.all
  end

  def task_params
    params.require(:task).permit(:content, :category_id).merge(family_id: @family.id)
  end
end

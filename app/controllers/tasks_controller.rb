class TasksController < ApplicationController
  def new
    @family = Family.find(params[:family_id])
    @task = Task.new
    @tasks = @family.tasks
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to new_family_task_path(params[:family_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:content, :category_id).merge(family_id: params[:family_id])
  end
end

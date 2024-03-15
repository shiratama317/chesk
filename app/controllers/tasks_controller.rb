class TasksController < ApplicationController
  def new
    @family = Family.find(params[:family_id])
    @task = Task.new
    @tasks = @family.tasks
    @categories = Category.all
  end

  def create
  end
end

class TasksController < ApplicationController
  def index
    @task = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    Task.create(task_params)
    redirect_to new_task_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :description)
  end

end

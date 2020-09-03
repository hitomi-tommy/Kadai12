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
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "編集しました！"
    else
      render :edit
    end
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

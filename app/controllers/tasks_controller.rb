class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    if params[:sort_expired]
      @task = Task.all.order(deadline: :ASC)
    elsif params[:sort_priority]
      @task = Task.all.order(priority: :ASC)
    elsif
      @task = Task.all.order(created_at: :DESC)
    end


    if params[:search].present?
      if params[:name_search].present? && params[:status_search].present?
        @task = Task.status(params[:status_search]).task_name_like(params[:name_search])
      elsif params[:name_search].present?
        @task = Task.task_name_like(params[:name_search])
      elsif params[:status_search].present?
        @task = Task.status(params[:status_search])
      end
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: t('notice.create')
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: t('notice.update')
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: t('notice.destroy')
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :deadline, :status, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

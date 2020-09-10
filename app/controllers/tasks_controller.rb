class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    if params[:sort_expired]
      @tasks = Task.all.order(deadline: :ASC).page(params[:page]).per(10)
    elsif params[:sort_priority]
      @tasks = Task.all.order(priority: :ASC).page(params[:page]).per(10)
    elsif
      @tasks = Task.all.order(created_at: :DESC).page(params[:page]).per(10)
    end


    if params[:search].present?
      if params[:name_search].present? && params[:status_search].present?
        @tasks = Task.status(params[:status_search]).task_name_like(params[:name_search]).page(params[:page]).per(10)
      elsif params[:name_search].present?
        @tasks = Task.task_name_like(params[:name_search]).page(params[:page]).per(10)
      elsif params[:status_search].present?
        @tasks = Task.status(params[:status_search]).page(params[:page]).per(10)
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

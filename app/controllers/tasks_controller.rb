class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :current_user

  def index
    if params[:sort_expired]
      @tasks = current_user.tasks.order(deadline: :ASC).page(params[:page]).per(3)
    elsif params[:sort_priority]
      @tasks = current_user.tasks.order(priority: :ASC).page(params[:page]).per(3)
    elsif params[:search].present?
      if params[:name_search].present? && params[:status_search].present?
        @tasks = Task.status(params[:status_search]).task_name_like(params[:name_search]).page(params[:page]).per(3)
      elsif params[:name_search].present?
        @tasks = Task.task_name_like(params[:name_search]).page(params[:page]).per(3)
      elsif params[:status_search].present?
        @tasks = Task.status(params[:status_search]).page(params[:page]).per(3)
      else
        @tasks = current_user.tasks.order(created_at: :ASC).page(params[:page]).per(3)
      end
    else
      @tasks = current_user.tasks.order(created_at: :ASC).page(params[:page]).per(3)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
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
    if @task.destroy
      redirect_to tasks_path, notice: t('notice.destroy')
    else
      redirect_to admin_users_path, notice: t('notice.notdeleted')
    end
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :deadline, :status, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

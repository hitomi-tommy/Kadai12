class Admin::UsersController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :require_admin

  def index
    @users = User.includes(:tasks)
    @users = User.all.order("created_at DESC")
    @users = @users.page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_url(@user), notice: t('admin.new')
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: t('admin.edit')
    else
      render :edit
    end
  end

  def show
    @tasks = @user.tasks.page(params[:page]).per(5)
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: t('admin.destroy')
    else
      redirect_to admin_users_path, notice: t('admin.admin_users_cannot_be_deleted')
    end
  end

  private
  def require_admin
    redirect_to tasks_path, notice: t('admin.not_authorized') unless current_user.admin?
  end

  def set_admin
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end

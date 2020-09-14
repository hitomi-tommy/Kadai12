class Admin::UsersController < ApplicationController
  before_action :current_user
  # before_action :ensure_admin_user
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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
      redirect_to admin_user_url(@user), notice: t('view.admin.new')
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: t('view.admin.edit')
    else
      render :edit
    end
  end

  def show
    @tasks = @user.tasks.page(params[:page]).per(5)
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: t('view.admin.destroy')
    else
      redirect_to admin_users_path, notice: t('view.admin.admin_users_cannot_be_deleted')
    end
  end

  private
  def ensure_admin_user
    unless current_user && current_user.admin == true
      flash[:notice] = t("admin.not_authorized")
      redirect_to(tasks_path)
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end

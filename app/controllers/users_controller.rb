class UsersController < ApplicationController
  skip_before_action :user_check, only: [:new, :create]

  def new
    if logged_in?
      flash[:notice] = "既にログインしています"
      redirect_to tasks_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to tasks_path
    end
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
end

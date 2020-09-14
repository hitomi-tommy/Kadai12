class ApplicationController < ActionController::Base
  protect_from_forgery with: :exceptions
  include SessionsHelper

  before_action :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_check
    unless current_user.nil?
      redirect_to tasks_path
    end
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exceptions
  include SessionsHelper

  before_action :user_check

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_check
    unless logged_in?
      redirect_to new_session_path
    end
  end

end

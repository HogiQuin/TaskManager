class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user



  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/login' unless current_user
  end

  def require_admin
    redirect_to '/404'  unless current_user.admin?
  end

  def require_instructor
    redirect_to '/404' unless current_user.instructor?
  end

  def require_student
    redirect_to '/404'  unless current_user.student?
  end
end

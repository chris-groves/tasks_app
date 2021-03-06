class ApplicationController < ActionController::Base

private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to new_session_path, alert: "Not authorised" if current_user.nil?
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login

  private 
  def not_authenticated
  	redirect_to new_user_session_path, alert: 'You need to login to do this.'
  end

end

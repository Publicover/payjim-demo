class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

   def current_user
     @current_user ||= User.find(session[:user_id])
   end

  def logged_in?
    redirect_to login_path, notice: "You must log in to access this page" unless session[:user_id]
  end

  def logged_in_as_admin?
    redirect_to root_path, notice: "You do not have permission to view this page." unless session[:user_role] == "#{ENV['BILLING_TYPE']}"
  end
end

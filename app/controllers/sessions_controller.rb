class SessionsController < ApplicationController
  before_action :disable_nav

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_role] = user.role
      if user.role == "#{ENV['BILLING_TYPE']}"
        redirect_to root_path, notice: 'Welcome back, loyal employee.'
      else
        redirect_to invoices_path, notice: 'You have logged in.'
      end
    else
      flash.now[:alert] = 'Invalid email or password.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'You have logged out.'
  end

  private

    def disable_nav
      @disable_nav = true
    end
end

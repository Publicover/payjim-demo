class ResumesController < ApplicationController
  def new
    @user = User.find(params[:id])
    ResumeMailer.send_resume(@user).deliver_now
  end
end

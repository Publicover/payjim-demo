class ResumeMailer < ApplicationMailer
  def send_resume(user)
    @greeting = "Hi there."
    @user = user
    attachments['jim_resume.pdf'] = File.read('public/jim_resume.pdf')
    mail to: user.email, subject: "Jim's resume"
  end
end

class ResetMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reset_mailer.password_reset.subject
  #
  def password_reset(user)
    @greeting = "Hi there."
    @user = user
    mail to: user.email, subject: 'dash creative billing password reset'
  end
end

# Preview all emails at http://localhost:3000/rails/mailers/reset_mailer
class ResetMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reset_mailer/password_reset
  def password_reset
    ResetMailerMailer.password_reset
  end

end

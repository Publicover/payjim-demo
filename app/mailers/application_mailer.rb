class ApplicationMailer < ActionMailer::Base
  default from: "#{ENV['GMAILU']}"
  layout 'mailer'
end

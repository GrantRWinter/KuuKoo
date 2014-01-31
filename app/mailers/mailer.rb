class Mailer < ActionMailer::Base
  default from: "default@gmail.com"

  def welcome_email(current_user)
    @user = current_user
    @url = "http://www.google.com"
    mail(to: @user.email, subject: "Welcome to my Awesome Site")
  end

  def spoof_email(current_user)
  	@user = current_user
  	@message = current_message
  	mail(to: @recipient_email, subject: @subject)
  end
end
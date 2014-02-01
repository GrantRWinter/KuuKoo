class Mailer < ActionMailer::Base
	add_template_helper(ApplicationHelper)	

  default from: "default@gmail.com"

  def welcome_email(current_user)
    @user = current_user
    @url = "http://www.google.com"
    mail(to: @user.email, subject: "Welcome to my Awesome Site")
  end

  def spoof_email(current_message, current_user)
  	@user = current_user
  	@message = current_message
  	mail(to: @message.recipient_email, subject: @message.subject, from: @user.email)
  end
end
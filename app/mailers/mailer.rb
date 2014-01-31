class Mailer < ActionMailer::Base
  default from: "grantrwinter@gmail.com"

  def welcome_email(current_user)
    @user = current_user
    @url = "http://www.google.com"
    mail(to: @user.email, subject: "Welcome to my Awesome Site")
  end

end

  
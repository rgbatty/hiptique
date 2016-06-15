class UserMailer < ApplicationMailer
  default from: "do-not-reply@hiptique.herokuapp.com"

  def welcome_email(user)
    @user = user
    @url  = "http://hiptique.herokuapp.com/login"
    mail(to: @user.email, subject: "Welcome to Hiptique!")
  end
end

class UserMailer < ApplicationMailer
  default from: "frederic.crozatier@protonmail.com"

  def welcome_email
    @user = params[:user]
    @url = Rails.env.development? ? "http://localhost:3000/" : "https://afternoon-taiga-51893.herokuapp.com/"
    mail(to: @user.email, subject: "Welcome")
  end
end

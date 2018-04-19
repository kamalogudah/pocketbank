class UserMailer < ApplicationMailer
  def received_money(user)
    @user  = user
    mail to: user.email, subject: "You got money"
  end
end

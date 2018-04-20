class UserMailer < ApplicationMailer
  def received_money(user, recipient, amount)
    @sender  = user
    @recipient = recipient
    @amount = amount
    mail to: @recipient.email, subject: "You got money"
  end

  def sent_money(user, recipient, amount)
    @sender  = user
    @recipient = recipient
    @amount = amount
    mail to: @sender.email, subject: "You sent money"
  end
end

class UserMailerPreview < ActionMailer::Preview

  def received_money
    user = User.first
    UserMailer.received_money(user)
  end
end

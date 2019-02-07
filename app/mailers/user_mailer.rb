class UserMailer < ApplicationMailer

  def activation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Activation Email')
  end
end

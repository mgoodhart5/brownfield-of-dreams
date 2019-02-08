class UserMailer < ApplicationMailer

  def activation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Activation Email')
  end

  def invite_email(invite_info)
    @invite_info = invite_info
    mail(to: @invite_info.email, subject: 'Invite Email')
  end

end

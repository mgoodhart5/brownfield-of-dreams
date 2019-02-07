# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def activation_mail_preview
    UserMailer.activation_email(User.last)
  end
end

class UserMailer < ApplicationMailer
  def forgot_password
    @user = params[:user]
    mail(to: @user.email, subject: 'Reset your password here')
  end
end

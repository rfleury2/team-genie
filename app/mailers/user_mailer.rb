class UserMailer < ApplicationMailer
  def password_reset(user)
    @user = user
    mail(
    	:to => @user.email,
    	:subject => "TeamGenie Sports - Reset Your Password"
    	)
  end
end

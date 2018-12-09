class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
  # this sends an welcome email when user first sign up
 	def welcome_email
    	@user = params[:user]
    	@url  = 'http://example.com/login'
    	mail(to: @user.email, subject: 'Welcome to My Awesome Site')
 	end
end
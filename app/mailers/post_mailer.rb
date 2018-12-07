class PostMailer < ApplicationMailer
	default from: 'notifications@example.com'
 
  def post_created(user)
  
  	mail(to: user.email,
  		from: "service@gmail.com",
  		subject: "thanks!",
  		body: "this is my first mailer"
  		)
end
end

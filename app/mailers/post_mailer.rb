class PostMailer < ApplicationMailer
	default from: 'notifications@example.com'
	# this mailer sends an email to the user if he has created or posted a new recipe in a way it is useful to know authenticated user!
 	def post_created(user)
  		mail(to: user.email,
  		from: "service@mydomain.com",
  		subject: "thanks!",
  		body: "this is my first mailer"
  		)
	end
end

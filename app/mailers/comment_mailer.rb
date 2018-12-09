class CommentMailer < ApplicationMailer
	# default from: 'notifications@example.com'
  # this is for an user comments on an recipe Mailer action is used to send by setting up the sendgrid email
  def comment_created(current_user,post_user,content)
    @current_user = current_user
    @post_user = post_user
    @content = content
  	mail(to: post_user.email,
  		  from: "service@recipeapp.com",
  		  subject: "Comment Created!"
        )
 end
end
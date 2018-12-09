class CommentsController < ApplicationController
	#before_action :find_post
	# when user comments on a recipe this sends an email to the current user with the commented message
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comments_params)
		@user = current_user
		CommentMailer.comment_created(current_user,@post.user,@comment.content).deliver
		redirect_to post_path(@post)
	# @comment.user_id = current_user.id
	# @comment.save

	# 	if @comment.save
			
	# 	else
	# 		render 'new'
	# 	end
	end

	private

	def comments_params
		params.require(:comment).permit(:content)
	end

end

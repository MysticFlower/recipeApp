module LikesHelper
    def count_like(post)
        post.likes.where(like: true).count
    end
    
   def find_like
       @like = @post.likes.find(params[:id])
   end
end

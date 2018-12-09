class Comment < ApplicationRecord
	#the comments are in regards to posts
    belongs_to :post
  # belongs_to :user
end

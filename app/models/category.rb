class Category < ApplicationRecord
	# each category can have many posted recipes
    has_many :posts
end

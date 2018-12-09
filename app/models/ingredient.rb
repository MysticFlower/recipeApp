class Ingredient < ApplicationRecord
	# ingredients belongs to posts(recipe)
  belongs_to :post
end

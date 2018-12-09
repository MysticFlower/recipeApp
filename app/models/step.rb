class Step < ApplicationRecord
	#recipe has direction to prepare the recipe
  belongs_to :post
end

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes, dependent: :destroy
  
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true
  
  #has_one_attached :image
  
  
  default_scope -> { includes(:user).order(created_at: :desc) }
  
  scope :by_category,-> (branch, category_name) do 
    joins(:category).where(categories: {name: category_name, branch: branch}) 
  end

  scope :by_branch, -> (branch) do
    joins(:category).where(categories: {branch: branch}) 
  end

  scope :search, -> (search) do
    where("title LIKE lower(?) OR content LIKE lower(?)", "%#{search}%", "%#{search}%")
  end

end
#lower(style) LIKE lower(?) name LIKE '%neon%'     like('%neon%',name)
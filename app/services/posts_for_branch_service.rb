class PostsForBranchService
  def initialize(params)
    @search = params[:search]
    @category = params[:category]
    @branch = params[:branch]
  end

  # this is the code for searching with different types using if else conditions
  #this is service design pattern to put code at one place so that the code is easy to test.
  # get posts depending on the request
  def call
    if @category.blank? && @search.blank?
      posts = Post.by_branch(@branch).all
    elsif @category.blank? && @search.present?
      posts = Post.by_branch(@branch).search(@search)
    elsif @category.present? && @search.blank?
      posts = Post.by_category(@branch, @category)
    elsif @category.present? && @search.present?
      posts = Post.by_category(@branch, @category).search(@search)
    else
    end
  end
end
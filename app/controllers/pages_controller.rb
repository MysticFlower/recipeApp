class PagesController < ApplicationController
    def index
  @posts = Post.limit(5)
    @vegetarian_posts = Post.by_branch('vegetarian').limit(8)
    @non_vegetarian_posts = Post.by_branch('non_vegetarian').limit(8)
    @vegan_posts = Post.by_branch('vegan').limit(8)
  
end
end
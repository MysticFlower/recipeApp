class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_signed_in, only: [:new]
  
  def index
    @posts = Post.all
  end 
  
def show
    @posts = Post.find(params[:id])
end
  def new
    @branch = params[:branch]
    @categories = Category.where(branch: @branch)
    @post = Post.new
  end
 # GET /recipes/1/edit
  def create
    @post = Post.new(post_params)
     respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def edit
    @branch = params[:branch]
    @categories= Category.all.map{ |c| [c.name, c.id] }
  end
#the action is for returning the data in specific page
 
  
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def vegetarian
    posts_for_branch(params[:action])
  end

  def non_vegetarian
    posts_for_branch(params[:action])
  end

  def vegan
    posts_for_branch(params[:action])
  end

#retrive all categories at specific branch and pagination is used for chaining and query with active record 
#displaying page links 
private
  def post_params
  params.require(:post).permit(:image, :content, :title, :category_id, ingredients_attributes:[:id, :description, :_destroy], steps_attributes:[:id, :direction, :_destroy])
                       .merge(user_id: current_user.id)
  end
def posts_for_branch(branch)
  @categories = Category.where(branch: branch)
  @posts = get_posts.paginate(page: params[:page])
end

  # def post_params
  #     params.require(:post).permit(:remove_image, :content, :title, :category_id).merge(user_id: current_user.id)
  #     :description, :image, ingredients_attributes:[:id, :content, :_destroy], 
  #     steps_attributes:[:id, :direction, :_destroy]
  # end

respond_to do |format|
  format.html
  format.js { render partial: 'posts/posts_pagination_page' }
end
def set_post
      @post = Post.find(params[:id])
    end

#this method will store the posted recipe
def get_posts
    PostsForBranchService.new({
      search: params[:search],
      category: params[:category],
      branch: params[:action]
    }).call
  end
end

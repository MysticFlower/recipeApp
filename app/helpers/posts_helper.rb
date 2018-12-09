module PostsHelper

  def create_new_post_partial_path
    if user_signed_in?
      'posts/branch/create_new_post/signed_in'
    else
      'posts/branch/create_new_post/not_signed_in'
    end
  end
  # if user selects all from the category then this shows all posted recipes else nothing 
  def all_categories_button_partial_path
    if params[:category].blank?
      'posts/branch/categories/all_selected'
    else
      'posts/branch/categories/all_not_selected'
    end
  end
  # if there are no posted recipes then it shows an empty message
  def no_posts_partial_path(posts)
    posts.empty? ? 'posts/shared/no_posts' : 'shared/empty_partial'
  end

  def post_format_partial_path
    current_page?(root_path) ? 'posts/post/home_page' : 'posts/post/branch_page'
  end
  # if category is present then it takes from the search form for searching the recipe and show an null if nothing is selected
  def category_field_partial_path
    if params[:category].present?
      'posts/branch/search_form/category_field'
    else
      'shared/empty_partial'
    end
  end
  # if user comes to the end of the page then it refresh the page with  new recipes by lorepsm
  def update_pagination_partial_path
    if @posts.next_page
      'posts/posts_pagination_page/update_pagination'
    else
      'posts/posts_pagination_page/remove_pagination'
    end
  end
end
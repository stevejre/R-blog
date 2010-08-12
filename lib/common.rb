module Common

protected
 
  def load_posts_and_categories
     @posts_list = Post.find(:all,:order => 'created_at DESC')
     @categories_list = Category.find(:all)
  end

  def user_type
     @current_user = User.find(:first, :conditions => ['id = ?',session[:user_id]]);
  end

end

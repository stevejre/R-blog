class SearchController < ApplicationController
  def index
  @search_results = Post.paginate :all, :conditions => ["body LIKE ? or title LIKE ?","%#{params[:q]}%","%#{params[:q]}%"], :page => params[:page], :order => 'created_at DESC'
  end
end

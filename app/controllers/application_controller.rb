# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include LoginSystem
  include Common
  before_filter :load_posts_and_categories
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  layout "application"
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  helper_method :current_user,:admin?

  private

  def current_user_session
     return @current_user_session if defined?(@current_user_session)
     @current_user_session = User.find(:first, :conditions => ['id = ?',session[:user_id]]);
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session
  end

  def admin?
     current_user.user_type 
  end
end

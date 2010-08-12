module LoginSystem

protected

def is_logged_in?
  @logged_in_user = User.find(session[:user_id]) if session[:user_id]
end

def logged_in_user
  return @logged_in_user if is_logged_in?
end

def logged_in_user=(user)
  if !user.nil?
    session[:user_id] = user.id
    @logged_in_user = user
  end
end

def self.included(base)
  base.send :helper_method, :is_logged_in?, :logged_in_user
end

def login_required
  unless is_logged_in?
    flash[:notice] = "you must be logged in to do that"
    redirect_to signin_path
  end
end
end

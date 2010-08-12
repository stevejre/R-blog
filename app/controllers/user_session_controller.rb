class UserSessionController < ApplicationController
  def index
  end

  def signin
  if session[:user_id]
    flash[:notice] = 'You attempted to visit a page which can only be viewed when you are logged out'
     redirect_to posts_url
   else
     if request.post?
      user = User.authenticate(params[:email],params[:password])
      if user
        session[:user_id] = user.id
        if user.user_type == '1'
          redirect_to admin_index_url
        else
          redirect_to posts_url
        end
      else
        flash[:notice] = 'Invalid username/password combination'
        redirect_to(:action => 'signin')
      end
    end
  end
 end

 def logout
   session[:user_id] = nil
   flash[:notice] = 'Logged out'
   redirect_to posts_url
 end

end

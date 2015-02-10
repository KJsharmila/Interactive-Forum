class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :current_user

  def current_user
  	@current_user ||= User.find_by_id(session[:user_id])
  end

  def require_login
  	unless session[:user_id]
  		flash[:error]="you must logged in to access this section!"
       redirect_to root_path # halts request cycle
     end
   end
 end

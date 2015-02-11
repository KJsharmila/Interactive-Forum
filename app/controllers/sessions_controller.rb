class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.js{}
    end
  end
def check_email
      @user = User.find_by_email(params[:email])
     
      respond_to do |format|
        format.json { render :json => @user.present? }
        
      end
    end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      respond_to do |format|
        format.html{ redirect_to forums_path }
         flash[:success] = "You have successfully logged"
        
      end
    else
      
      redirect_to root_path
      flash[:error] = "You must be logged in to access this section"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :success => "Logged out!"
  end
end
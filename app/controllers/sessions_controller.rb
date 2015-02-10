class SessionsController < ApplicationController

  def new
    respond_to do |format|
      format.js{}
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      respond_to do |format|
        format.html{ redirect_to forums_path }
      end
    else
      flash.now.alert = "Invalid email or password"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :success => "Logged out!"
  end
end
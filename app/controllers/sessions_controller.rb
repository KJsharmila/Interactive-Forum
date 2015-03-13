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
  if params[:provider] == "google_oauth2"
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
  else
    user = User.authenticate(params[:email], params[:password])
  end
  if user && user.email_confirmation == true
    session[:user_id] = user.id
    flash[:success] = "Signed in Successfully"
    redirect_to home_path, :success => "Logged in!"
  else
    flash[:alert] = "Email ID not confirmed, Please check your email"
    redirect_to root_path
  end
end

def confirmation
    @user = User.find(params[:id])
    session[:user_id] = @user.id
    @user.update(email_confirmation: true)
    redirect_to home_path
    flash[:success] = "Thank you for your email confirmation"
  end

def destroy
  session[:user_id] = nil
  redirect_to root_path
  flash[:alert] = "Logged out!"
end
end
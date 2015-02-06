class UsersController < ApplicationController

  def new
    @user = User.new
    respond_to do |format|
      format.js{}
  end
end

  def check_email

@user = User.find_by_email(params[:user][:email])

respond_to do |format|
format.json { render :json => !@user }
end
end


  def create
   @user = User.new(user_params)
    if @user.valid? && @user.errors.blank?
      session[:user_id] = @user.id
      respond_to do |format|
        format.js { redirect_to(users_path, :notice => 'Account created Successfully.') }
      end
    else
     render 'new'
    end
  end
def user_params
      params.require(:user).permit(:name, :email,:password, :password_confirmation)
end
end
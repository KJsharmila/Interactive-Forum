class UsersController < ApplicationController

  def home
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def index
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path }
      else
        format.html { redirect_to root_path }
      end
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email,:password,:password_confirmation)
  end
end

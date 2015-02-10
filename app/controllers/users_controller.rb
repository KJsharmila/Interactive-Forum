  class UsersController < ApplicationController
    def check_email
      @user = User.find_by_email(params[:user][:email])

      respond_to do |format|
        format.json { render :json => !@user  }
      end
    end

    def new
      @user = User.new
      respond_to do |format|
        format.js{}
      end
    end

    def create
      @user = User.new(user_params)
      if @user.valid? && @user.errors.blank?
        @user.save
        @success = true
        session[:user_id] = @user.id
      else
        @success = false
      end
      redirect_to forums_path
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
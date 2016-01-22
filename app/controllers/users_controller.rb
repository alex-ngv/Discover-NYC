class UsersController < ApplicationController

  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if User.find_by username: @user.username
      flash.notice = 'Username is taken'
      redirect_to articles_path
    else
      flash.notice = "#{@user.username} was created!"
      @user.save
      redirect_to articles_path
    end
  end




  def profile
    authenciate
    @user = current_user
  end

  def log_in
  end


private

  def user_params
    params.require(:user).permit(:username,:password)
  end

end

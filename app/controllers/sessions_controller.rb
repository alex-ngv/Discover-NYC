class SessionsController < ApplicationController

def create
  username = params[:username]
  password = params[:password]
  user = User.find_by({username: username})
  if user && user.authenticate(password)
    session[:user_id] = user.id
    session[:user_name] =user.username
    redirect_to articles_path
  else
    redirect_to log_in_path
    flash.notice = params[:password], params[:username]
  end
end


def destroy
  session[:user_id] = nil
  redirect_to articles_path
end


end

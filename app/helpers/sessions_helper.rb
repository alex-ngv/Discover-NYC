module SessionsHelper

  def authenciate
    if current_user
    else redirect_to articles_path
      flash.notice = 'please log in'
    end
  end

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end


end

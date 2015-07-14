module ApplicationHelper
  def current_user
    begin
      if session[:user_id]
        current_user = User.find(session[:user_id])
      end
    rescue
      session.clear
    end
  end
end

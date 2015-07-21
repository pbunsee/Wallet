class SessionsController < ApplicationController

  def create
    user =  User.authenticate(params[:username], params[:password])
    puts "in create SessionsController - user.inspect is #{user.inspect}"
    if user
      session[:user_id] = user.id
      flash[:welcome] = "Welcome!"
      redirect_to user_path(user.id)
    else
      flash[:alert] = "Invalid Credentials"
      redirect_to new_session_path
    end

    #session.clear
    #user = User.find_by_username(params[:username])
    #if user
      #if user.password == params[:password]
        #session[:user_id] = user.id
        #flash[:welcome] = "Welcome!"
        #redirect_to user_path(user.id)
      #end
    #else
      #flash[:alert] = "Invalid Credentials"
      #redirect_to new_session_path
    #end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = "Logged out user"
    redirect_to root_path
  end

end

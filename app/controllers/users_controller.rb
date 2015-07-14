class UsersController < ApplicationController

 def new
    session.clear
    @user = User.new
  end

  def index
    redirect_to new_session_path unless current_user
    @users = User.all
  end

  def create
    @user = User.create user_params
    if @user.valid?
      flash[:notice] = "Signed up successfully!"
      redirect_to users_path
    else
      flash[:alert] = "Problems reported - refer to exceptions below."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                 :firstname,
                                 :lastname,
                                 :phone,
                                 :password,
                                 :email,
                                 :password_confirmation)
  end

end

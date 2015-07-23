class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    redirect_to new_session_path unless current_user
    @users = User.all
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = "Signed up successfully!"
      redirect_to users_path
    else
      flash[:alert] = "Error signing up"
      render :new
    end
  end
  
  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                 :firstname,
                                 :lastname,
                                 :phone,
                                 :password_salt,
                                 :password_hash,
                                 :email)
  end

end

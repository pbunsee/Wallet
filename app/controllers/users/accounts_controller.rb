class Users::AccountsController < ApplicationController

  def index
    if current_user
      @user = User.find current_user
      @accounts = @user.accounts
    else
      @accounts = Account.all
    end
  end

  def new
    @user = User.find current_user
    @account = Account.new
  end

  def show
    @account = Account.find(params[:id])
  end

  def create
    if current_user.present?
      @user = User.find current_user
      @account = Account.new(account_params)
      @account.users << current_user

      if @account.valid?
        @account.save!
        #redirect_to user_path(current_user)
        redirect_to user_accounts_path(current_user)
      else
        flash[:alert] = "There was an error with your submission"
        render :new
      end
    end
  end

  def show
    @account = Account.find(params[:id])
  end

  private

  def account_params
    params.require(:account).permit(:number, :acctype, :balance)
  end

end

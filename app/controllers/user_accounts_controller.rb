class UserAccountsController < ApplicationController
  def create
    user = User.find user_account_params[:user_id]
    UserAccount.create user_account_params
    redirect_to user_accounts_path(user)
  end

  private

  def user_account_params
    params.require(:user_account).permit(:user_id, :account_id)
  end
end

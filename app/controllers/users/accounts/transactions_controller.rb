class Users::Accounts::TransactionsController < ApplicationController

  def index
    if current_user
      @user = User.find current_user
      @transactions = Transaction.all_of_user(@user)
      if params[:account_id].present?
        @account = Account.find params[:account_id]
        @transactions = Transaction.all_of_user(@user).acc_of_user(@account)
      end
    end
  end

  def new
    if current_user
      @user = User.find current_user
      if params[:account_id].present?
        @account = Account.find params[:account_id]
        @transaction = Transaction.new
      end
    end
  end

  def create
    if current_user
      @transaction = Transaction.new(transaction_params)
      if @transaction.valid?
        @transaction.save!
        redirect_to user_account_transactions_path(current_user, params[:account_id])
      else
        flash[:alert] = "There was an error with your submission"
        render :new
      end
    end
  end

  def show
    if current_user
      @transaction = Transaction.find(params[:id])
    end
  end

  private

    def transaction_params
      params.require(:transaction).permit(:description, 
                                          :amount, 
                                          :currency, 
                                          :transaction_type, 
                                          :transaction_status,
                                          :transaction_date, 
                                          :post_date, 
                                          :merchant, 
                                          :account_id, 
                                          :created_at, 
                                          :updated_at, 
                                          :associated_entity,
                                          :card_id)
    end
end


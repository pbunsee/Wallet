class TransactionsController < ApplicationController

  def index
    if params[:user_id].present?
      @user = User.find params[:user_id]
      @transactions = @user.accounts.transactions.all
    end
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    #@transaction.users << current_user  transaction belongs to account

    if @transaction.valid?
      @transaction.save!
      redirect_to transactions_path
    else
      flash[:alert] = "There was an error with your submission"
      render :new
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  private

  def transaction_params
    params.require(:transaction).permit(:description, :amount, :currency, :transaction_date, :post_date, :from_account, :to_account)
  end

end

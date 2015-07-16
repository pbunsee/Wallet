class TransactionsController < ApplicationController

  def index
    if current_user
      @user = User.find current_user
      @transactions = Transaction.all_of_user(@user)
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
    params.require(:transaction).permit(:description, 
                                        :amount, 
                                        :currency, 
                                        :transaction_date, 
                                        :post_date, 
                                        :from_account, 
                                        :to_account, 
                                        :account_id, 
                                        :associated_entity, 
                                        :card_id)
  end

end

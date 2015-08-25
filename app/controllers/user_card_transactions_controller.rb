class TransactionsController < ApplicationController

  def index
    if params[:user_id].present?
      @user = User.find current_user
      if params[:card_id].present?
        @card = Card.find params[:card_id]
        @transactions = Transaction.all_of_user(@user).card_of_user(@card)
      end
    end
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.valid?
      @transaction.save!
      redirect_to user_card_transactions_path
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

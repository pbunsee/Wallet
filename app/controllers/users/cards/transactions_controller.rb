class Users::Cards::TransactionsController < ApplicationController

  def dispute
    @transaction = Transaction.find(params[:id])
    respond_to do |format|
      format.js do
        #update db status flag
        @response = "msg-#{@transaction.id}"
      end
    end
  end

  def index
    if params[:user_id].present?
      @user = User.find current_user
      @transactions = Transaction.all_of_user(@user)
      if params[:card_id].present?
        @card = Card.find params[:card_id]
        @transactions = Transaction.all_of_user(@user).card_of_user(@card)
      end
    end
  end

  def new
    if params[:user_id].present?
      @user = User.find current_user
      if params[:card_id].present?
        @card = Card.find params[:card_id]
        @transaction = Transaction.new
      end
    end
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.valid?
      @transaction.save!
      redirect_to user_card_transactions_path(current_user, params[:card_id])
    else
      flash[:alert] = "There was an error with the transaction submission"
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

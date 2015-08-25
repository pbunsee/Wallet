class Users::Cards::TransactionsController < ApplicationController

  def dispute
    @transaction = Transaction.find(params[:id])
    if @transaction.transaction_status != 'Dispute process started'
      @transaction.update(transaction_status: 'Dispute process started')
      respond_to do |format|
        format.js do
          @response = "msg-#{@transaction.id}"
        end
      end
    else
      respond_to do |format|
        format.js do
          @response = ""
        end
      end
    end
  end

  def index
    if current_user
      @user = User.find current_user
      @transactions = Transaction.all_of_user(@user)
      if params[:card_id].present?
        @card = Card.find params[:card_id]
        @transactions = Transaction.all_of_user(@user).card_of_user(@card)
      end
    end
  end

  def new
    if current_user
      @user = User.find current_user
      if params[:card_id].present?
        @card = Card.find params[:card_id]
        @transaction = Transaction.new
      end
    end
  end

  def create
    if current_user
      @transaction = Transaction.new(transaction_params)

      if @transaction.valid?
        @transaction.save!
        redirect_to user_card_transactions_path(current_user, params[:card_id])
      else
        flash[:alert] = "There was an error with the transaction submission"
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

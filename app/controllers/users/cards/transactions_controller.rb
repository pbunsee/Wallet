class Users::Cards::TransactionsController < ApplicationController

  def dispute
    @transaction = Transaction.find(params[:id])
    puts " what is transaction value : #{@transaction.inspect}"
    respond_to do |format|
      format.js do
        #update db status flag
        @response = "msg-#{@transaction.id}"
    puts " what is response value : #{@response.inspect}"
      end
    end
  end

  def index
    puts "where am i Users Cards Transactions -index route  TransactionController"
    puts "params.inspect #{params.inspect}"
    if params[:user_id].present?
      @user = User.find current_user
      puts "@transactions = Transaction.all_of_user(#{@user})"
      @transactions = Transaction.all_of_user(@user)
      if params[:account_id].present?
        @account = Account.find params[:account_id]
        puts "@transactions = Transaction.all_of_user(#{@user}).acc_of_user(#{@account})"
        @transactions = Transaction.all_of_user(@user).acc_of_user(@account)
      end
      if params[:card_id].present?
        @card = Card.find params[:card_id]
        puts "@transactions = Transaction.all_of_user(#{@user}).card_of_user(#{@card})"
        @transactions = Transaction.all_of_user(@user).card_of_user(@card)
      end
    end
  end

  def new
    if params[:user_id].present?
      @user = User.find current_user
    end
    if params[:card_id].present?
      @card = Card.find params[:card_id]
    end
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    #@transaction.users << current_user  transaction belongs to account

    if @transaction.valid?
      @transaction.save!
      redirect_to user_card_transactions_path(current_user, params[:card_id])
    else
      flash[:alert] = "There was an error with your submission"
      render :new
    end
  end

  def show
    puts "where am i  Users Cards Transactions-show route  TransactionController"
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

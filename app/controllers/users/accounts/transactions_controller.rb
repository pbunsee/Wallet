class Users::Accounts::TransactionsController < ApplicationController

  def index
    puts "where am i - Users Accounts Transactions - index"
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
    puts "where am i - Users Accounts Transactions - new"
    @transaction = Transaction.new
  end

  def create
    puts "where am i - Users Accounts Transactions - create"
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
    puts "where am i - Users Accounts Transactions - show"
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

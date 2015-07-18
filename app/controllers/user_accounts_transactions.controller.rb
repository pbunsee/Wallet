class TransactionsController < ApplicationController

  def index
    puts "cha where am i -index route user_account_transactions  TransactionController"
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
    puts "cha where am i -new route  user_account_transactions TransactionController"
    @transaction = Transaction.new
  end

  #def /:user_id/cards/:card_id/transactions/new/
    #puts "where am i -:user/cards/:card/transactions/new route  TransactionController"
    #@transaction = Transaction.new
  #end

  def create
    puts "cha where am i -create route  user_account_transactions TransactionController"
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
    puts "cha where am i -show route  user_account_transactions TransactionController"
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

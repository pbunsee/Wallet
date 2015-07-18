class Users::CardsController < ApplicationController

  def index
    #@cards = Card.all
    if current_user
      @user = User.find current_user
      @cards = @user.cards
    else
      @cards = Card.all
    end
  end

  def new
    @user = User.find current_user
    @card = Card.new
  end

  def create
    @user = User.find current_user
    @card = Card.new(card_params)
    @card.users << current_user

    if @card.valid?
      @card.save!
      redirect_to user_cards_path
    else
      flash[:alert] = "There was an error with your submission"
      render :new
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  private

  def card_params
    params.require(:card).permit(:number,
                                 :category,
                                 :credit_limit,
                                 :exp_date,
                                 :cvv)
  end

end

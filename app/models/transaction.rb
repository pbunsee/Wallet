class Transaction < ActiveRecord::Base
  belongs_to :card
  belongs_to :account

 # filter on a card id
  scope :card_of_user, proc { |card| card_id = card.id 
                                      where("card_id in (?)",
                                            UserCard.where(card_id: card_id).pluck(:id)) }

  # filter on an account id
  scope :acc_of_user, proc { |account| account_id = account.id 
                                      where("account_id in (?)",
                                            UserAccount.where(account_id: account_id).pluck(:id)) }

  # filter on all cards and accounts that belong to the logged in user
  scope :all_of_user, lambda { |user| user_id = user.id
                                      where("account_id in (?) OR card_id in (?)",
                                            UserAccount.where(user_id: user_id).pluck(:id),
                                            UserCard.where(user_id: user_id).pluck(:id)) }


  scope :per_date_range, lambda { where("transaction_date between ? and ?", :start_date, :end_date) } 

end

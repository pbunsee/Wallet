class Transaction < ActiveRecord::Base
  belongs_to :card
  belongs_to :account

 # simplified test
  scope :card_of_user, lambda { |user| user_id = user.id
                                      where("card_id in (?)",
                                            UserCard.where(user_id: user_id).pluck(:id)) }

  # simplified test
  scope :acc_of_user, lambda { |user| user_id = user.id
                                      where("account_id in (?)",
                                            UserAccount.where(user_id: user_id).pluck(:id)) }

  # intended query
  scope :all_of_user, lambda { |user| user_id = user.id
                                      where("account_id in (?) OR card_id in (?)",
                                            UserAccount.where(user_id: user_id).pluck(:id),
                                            UserCard.where(user_id: user_id).pluck(:id)) }


  scope :per_date_range, lambda { where("transactions.transaction_date between ? and ?", :start_date, :end_date) } 

  scope :per_account, lambda { where(associated_entity: "account").group("account_id") } 

  scope :per_card, lambda { where(associated_entity: "card").group("card_id") } 

  #scope :per_entity, lambda { group("associated_entity").group("account_id") } 
end

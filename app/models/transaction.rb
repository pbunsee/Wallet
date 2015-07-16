class Transaction < ActiveRecord::Base
  belongs_to :card
  belongs_to :account

  scope :all_of_user, lambda { |user| user_id = user.id
                                     where("user_id in 

  scope :per_date_range, lambda { where("transactions.transaction_date between ? and ?", :start_date, :end_date) } 

  scope :per_account, lambda { where(associated_entity: "account").group("account_id") } 

  scope :per_card, lambda { where(associated_entity: "card").group("card_id") } 

  #scope :per_entity, lambda { group("associated_entity").group("account_id") } 
end

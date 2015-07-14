class Transaction < ActiveRecord::Base
  belongs_to :card
  #belongs_to :account
end

class Account < ActiveRecord::Base
  validates_numericality_of :balance, {:greater_than => 0, :allow_nil => false, :message => "Balance must be a decimal > 0"}

   has_many :transactions
   has_many :user_accounts
   has_many :users, through: :user_accounts
end

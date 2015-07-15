class Account < ActiveRecord::Base
   #validates_numericality_of :balance, {:greater_than => 0, :allow_nil => false, :message => "Can only be a decimal number."}

   belongs_to :user
   has_many :transactions
end

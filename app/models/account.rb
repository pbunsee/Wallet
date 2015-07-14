class Account < ActiveRecord::Base
   validates :balance, {greater_than: 0}
   validates_numericality_of :balance, :allow_nil => true, :message => "Can only be decimal or integer number."
   # validates_numericality_of :balance, { greater_than: 0 }


   belongs_to :user
end

class Card < ActiveRecord::Base

  validate :extract_exp_mm_yy

  # Card Number (valid format) 
    #:validate_card_number

  before_save :set_category

  has_many :user_cards
  has_many :users, through: :user_cards
  has_many :transactions

  private
   
   def extract_exp_mm_yy
     # validate month
     exp_mm = (self.exp_date.strftime("%m")).to_i
     if exp_mm.between?(1, 12) 
       # validate year
       exp_yy = (self.exp_date.strftime("%Y")).to_i
       if !exp_yy.between?(2015, 2030) 
         errors.add(:exp_date, "Invalid expiry year")
         # can also attach the error to local variable - the error gets added to the error collection anyway
         # errors.add(:exp_mm, "Invalid expiry year")
       end
     else
       errors.add(:exp_date, "Invalid expiry month")
       # can also attach the error to local variable - the error gets added to the error collection anyway
       # errors.add(:exp_yy, "Invalid expiry month")
     end
   end

   def set_category
      first_digit = self.number[0]
      self.category = case first_digit
                       when '3'
                            'American Express'
                       when '4'
                            'VISA'
                       when '5'
                            'MasterCard'
                       when '6'
                            'Discover'
                       else
                            ''
                       end
    end

end

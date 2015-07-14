class Card < ActiveRecord::Base

  validates_inclusion_of :exp_mm, in: 1..12
  validates_inclusion_of :exp_yy, in: 2015..2025

  # Card Number (valid format) 
    #:validate_card_number

  before_save :set_card_type

  has_many :user_cards
  has_many :users, :through => :user_cards
  has_many :transactions

  private

    def set_card_type
      first_digit = self.card_number[0]
      self.card_type = case first_digit
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

class User < ActiveRecord::Base

  validates_presence_of :firstname, :lastname, :email

  validates :email, { uniqueness: { message: "email is already in use for another account" }}
  # can also do validates_uniqueness_of :email

  validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
  # can also do validates_format_of :phone, with: /\d{3}-\d{3}-\d{4}/

  validates_confirmation_of :password

  has_many :user_cards
  has_many :cards, through: :user_cards
  has_many :user_accounts
  has_many :accounts, through: :user_accounts
  
end

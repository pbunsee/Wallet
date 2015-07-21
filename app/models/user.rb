class User < ActiveRecord::Base

  validates_presence_of :firstname, :lastname, :email

  validates :email, { uniqueness: { message: "email is already in use for another account" }}
  # can also do validates_uniqueness_of :email

  validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
  # can also do validates_format_of :phone, with: /\d{3}-\d{3}-\d{4}/

  has_many :user_cards
  has_many :cards, through: :user_cards
  has_many :user_accounts
  has_many :accounts, through: :user_accounts

  # Omitted "dependent: :destroy" because accounts may be held jointly by spouse or business 
  # partners and a card may be issued to multiple members of a family or business employees

  before_create :encrypt_password
  attr_accessor :password

  validates_confirmation_of :password

  def encrypt_password
    if :password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(:password, password_salt)
    end
  end

  def self.authenticate(username, password)
    user = User.where(username: username).first
    logger.debug "user.inspect: #{user.inspect}"
    if user && user.password_hash == BCrypt::Engine.hash_secret(:password, user.password_salt)
      user
    else
      nil
    end
  end

end

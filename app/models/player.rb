class Player < ActiveRecord::Base
   #bcrypt requirement
   has_secure_password

   #associations
   belongs_to :country
   has_many :player_decks
   has_many :decks, through: :player_decks

   #validation for uniqueness
   validates :email, confirmation: { case_sensitive: false }, uniqueness: true
   validates :email_confirmation, presence: true
   validates :password, confirmation: true
   validates :password_confirmation, presence: true
   validates :username, uniqueness: true
end
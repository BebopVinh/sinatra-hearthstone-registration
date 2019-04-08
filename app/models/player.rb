class Player < ActiveRecord::Base
   has_secure_password

   belongs_to :country
   has_many :player_decks
   has_many :decks, through: :player_decks
end
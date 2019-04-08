class Deck < ActiveRecord::Base
   belongs_to :profession
   has_many :player_decks
   has_many :players, through: :player_decks
end
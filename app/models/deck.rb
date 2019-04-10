class Deck < ActiveRecord::Base
   belongs_to :profession
   belongs_to :creator, class_name: "Player", foreign_key: "creator_id"
   has_many :player_decks
   has_many :players, through: :player_decks
end
class PlayerDeck < ActiveRecord::Base
   belongs_to :player
   belongs_to :deck
end
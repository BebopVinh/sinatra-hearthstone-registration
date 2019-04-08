class CreatePlayerDecks < ActiveRecord::Migration
  def change
    create_table :player_decks do |t|
      t.integer :player_id
      t.integer :deck_id
    end
  end
end

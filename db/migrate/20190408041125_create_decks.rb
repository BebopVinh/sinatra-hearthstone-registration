class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.string :archetype
      t.integer :profession_id
    end
  end
end

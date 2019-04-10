class AddCodeToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :code, :string
  end
end

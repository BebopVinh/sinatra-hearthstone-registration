class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :country_id
    end
  end
end

class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :genre
      t.integer :online_players
      t.integer :couch_players
      t.date :release_date

      t.timestamps
    end
  end
end

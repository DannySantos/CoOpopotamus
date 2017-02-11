class CreateMarkedGames < ActiveRecord::Migration[5.0]
  def change
    create_table :marked_games do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end

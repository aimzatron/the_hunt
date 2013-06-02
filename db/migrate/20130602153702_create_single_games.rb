class CreateSingleGames < ActiveRecord::Migration
  def change
    create_table :single_games do |t|
      t.string :player
      t.string :location

      t.timestamps
    end
  end
end

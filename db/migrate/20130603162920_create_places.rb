class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :game_id
      t.integer :user_id
      t.string :street
      t.string :city
      t.string :state
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end

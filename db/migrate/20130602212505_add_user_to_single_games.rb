class AddUserToSingleGames < ActiveRecord::Migration
  def change
    add_column :single_games, :user, :string
  end
end

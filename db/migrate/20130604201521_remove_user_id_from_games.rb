class RemoveUserIdFromGames < ActiveRecord::Migration
  def up
    remove_column :games, :user_id
  end

  def down
    add_column :games, :user_id, :string
  end
end

class RemoveOauthTokenFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :oauth_token
  end

  def down
  end
end

class RemoveItemsFromCheckins < ActiveRecord::Migration
  def up
    remove_column :check_ins, :checkin_created_at
    remove_column :check_ins, :user_id
  end

  def down
  end
end

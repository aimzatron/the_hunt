class CreateCheckIns < ActiveRecord::Migration
  def up
    create_table "check_ins" do |t|
      t.column "checkin_created_at", :string
      t.column "text", :text
      t.column "venue", :string
      t.column "location", :string
      t.column "user_id", :integer
    end
  end

  def down
  end
end

class AddCheckinTimeAddressLatitudeLongitudeToCheckins < ActiveRecord::Migration
  def change
    add_column :check_ins, :checkin_time, :integer
    add_column :check_ins, :address, :string
    add_column :check_ins, :latitude, :float
    add_column :check_ins, :longitude, :float
  end
end

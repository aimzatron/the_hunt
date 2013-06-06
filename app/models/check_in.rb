class CheckIn < ActiveRecord::Base
  include ApplicationHelper
  belongs_to :user
  attr_accessible :venue, :text, :check_in_id, :checkin_time, 
                  :address, :latitude, :longitude

end

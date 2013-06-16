class Checkins < ActiveRecord::Base
  include ApplicationHelper
  belongs_to :user
  attr_accessible :venue, :text, :check_in_id, :checkin_time, 
                  :address, :latitude, :longitude

  def store_check_in(check_in)
    CheckIn.create(:event_created_at => Time.at(check_in.createdAt),
                   :check_in_id => check_in.id,
                   :text => check_in.shout,
                   :venue => check_in.venue,
                   :user_id => user.id)
  end

  def last_checkin
    info_hash = client.user_checkins.to_hash
    items_array = info_hash['items']
    last_checkin = items_array[0]
  end

  def checkin_time
    last_checkin['createdAt']
  end

  def checkin_id
    last_checkin['id']
  end

  def venue
    venue_info = last_checkin["venue"]
    venue_info["name"]
  end

  def address
    venue_info = last_checkin["venue"]
    location_info = venue_info["location"]
    street, city = location_info["address"], location_info["city"]
    state, zip= location_info["state"], location_info["postalCode"]
    "#{street}, #{city}, #{state}, #{zip}"
  end

  def latitude
    venue_array = last_checkin["venue"]
    location_array = venue_array['location']
    latitude = location_array['lat']
  end

  def longitude
    venue_array = last_checkin["venue"]
    location_array = venue_array['location']
    longitude = location_array['lng']
  end
end

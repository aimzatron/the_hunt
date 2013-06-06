module CheckInsHelper

  def last_checkin
    info_hash = client.user_checkins.to_hash
    items_array = info_hash['items']
    last_checkin = items_array[0]
  end

  def last_checkin_venue
    venue_info = last_checkin["venue"]
    location_info = venue_info["location"]
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

  def physical_address
    street= last_checkin_venue["address"] 
    city = last_checkin_venue["city"]
    state= last_checkin_venue["state"]
    zip = last_checkin_venue["postalCode"]
    "#{street}, #{city}, #{state}, #{zip}"
  end

  def lat
    last_checkin_venue['lat']
  end

  def lng
    last_checkin_venue['lng']
  end
end

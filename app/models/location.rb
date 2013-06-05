class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :gmap
  geocoded_by :address
  after_validation :geocode

  acts_as_gmappable

  def gmaps4rails_address
    "#{self.address}" 
  end

  # def checkin_match
  #   user_locations = Locations.all
  # end

end

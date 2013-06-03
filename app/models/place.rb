class Place < ActiveRecord::Base
  attr_accessible :city, :game_id, :gmaps, :latitude, :longitude, :state, :street, :user_id
  acts_as_gmappable

  def gmaps4rails_address
    "#{self.street}, #{self.city}, #{self.state}" 
  end

end

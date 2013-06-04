class Game < ActiveRecord::Base
  include ApplicationHelper
  attr_accessible :status, :uid
  has_one :user, as: :game
  
end

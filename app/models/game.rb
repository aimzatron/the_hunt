class Game < ActiveRecord::Base
  include ApplicationHelper
  attr_accessible :status, :uid, :starting_address, :id
  has_one :user, as: :game

  
end

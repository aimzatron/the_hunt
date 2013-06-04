class User < ActiveRecord::Base
  attr_accessible :uid, :firstName
  belongs_to :game, polymorphic: true

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]  
      user.name = auth["firstName"]
    end
  end
end

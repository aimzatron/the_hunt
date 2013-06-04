module ApplicationHelper

  def client
    client = Foursquare2::Client.new(:client_id => 'R4G5CER4VUSPJVJZSSF5R0RDGFQINY5IWNI2YOFIKCEOPYUX', :client_secret => 'MNWEDCFXRKSSKFH4H1DKS4GCVTQU5KWSRD3EYWS24MP0VBK4')
  end

  def current_id
    current_user.uid
  end

  def find_user_name
    client.user(current_id).firstName
  end

  def find_user_photo
    client.user(current_id).photo
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_info
    client.recent_checkins
  end
end

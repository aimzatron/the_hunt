class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end

  def find_user_name
    current_id = current_user.uid
    client = Foursquare2::Client.new(:client_id => 'R4G5CER4VUSPJVJZSSF5R0RDGFQINY5IWNI2YOFIKCEOPYUX', :client_secret => 'MNWEDCFXRKSSKFH4H1DKS4GCVTQU5KWSRD3EYWS24MP0VBK4')
    client.user(current_id).firstName

  end

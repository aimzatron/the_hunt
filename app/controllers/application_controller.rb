class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def client
    @client ||= Foursquare2::Client.new(:client_id => 'R4G5CER4VUSPJVJZSSF5R0RDGFQINY5IWNI2YOFIKCEOPYUX', :client_secret => 'MNWEDCFXRKSSKFH4H1DKS4GCVTQU5KWSRD3EYWS24MP0VBK4', :oauth_token => current_user.token)
  end
  helper_method :client

  def current_id
    current_user.uid
  end
  helper_method :current_id

  def find_user_name
    client.user(current_id).firstName
  end
  helper_method :find_user_name

  def find_user_photo
    client.user(current_id).photo
  end
  helper_method :find_user_photo

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def user_token
    client.user(current_id).oauth_token
  end
  helper_method :user_token
end

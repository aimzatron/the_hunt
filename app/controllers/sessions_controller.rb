class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed In!"
  end
  helper_method :create

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed Out!"
  end
  helper_method :destroy
  
end

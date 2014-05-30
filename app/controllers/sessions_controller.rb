class SessionsController < ApplicationController
  #setting up sessions create method for facebook login. When user logs in via facebook, Facebook will redirect user back to beeThree and look for sessions#create.
  skip_before_filter :signed_in_user
  skip_before_filter :venmo_check

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to products_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
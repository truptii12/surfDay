class SessionsController < ApplicationController
  
  
  def create
   auth = request.env["omniauth.auth"]
       # if you’d like to see the content of the auth hash and its keys
       # you can uncomment one of the next two statements
       # puts auth.inspect
       # raise auth.to_json
       user = User.find_by_provider_and_userid(auth["provider"], auth["uid"])
       # if the user has not been created yet, let’s create it
       # using the information from the auth
       if user == nil
       user = User.create_from_omniauth(auth)
       end
       session[:user_id] = user.id
       redirect_to root_url, notice: "Signed in!"
  end
  
  def signout
       session[:user_id] = nil
       redirect_to root_url, notice: "You have signed out!"
  end
  
end

class HomeController < ApplicationController

  def landing
  	if !user_signed_in?
  		redirect_to "/users/sign_up"
  	else
  		@friends = current_user.friends
  		@gifts = current_user.gifts
  	end
  end

end

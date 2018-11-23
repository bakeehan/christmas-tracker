class HomeController < ApplicationController
  def landing
  	if !user_signed_in?
  		redirect_to "/users/sign_up"
  	end
  end
end

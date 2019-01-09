class GiftsController < ApplicationController

def new
	if !user_signed_in?
		redirect_to "/users/sign_in"
	end
	@friends = current_user.friends
	@gift = Gift.new
end

def create
	@friends = current_user.friends
	@gift = Gift.new(gift_params)
	@gift.friend_id = params[:friend_id]
	@gift.user_id = current_user.id
	if @gift.title != "" && @gift.price
		if @gift.save
			redirect_to "/gifts"
		else
			render "/gifts/new"
		end
	else
		flash.notice = "Must include a name and price!"
		render "/gifts/new"
	end
end

def index
	if !user_signed_in?
		redirect_to "/users/sign_in"
	end
	@gifts = Gift.where(user: current_user)
end

def edit
	if !user_signed_in? || Gift.find(params[:id]).user != current_user
		redirect_to "/users/sign_in"
	end
	@friends = current_user.friends
	@gift = Gift.find(params[:id])
	if current_user != @gift.user
		redirect_to "/gifts"
	end
end

def update
	@gift = Gift.find(params[:id])
	@gift.friend_id = params[:friend_id]
	if @gift.update(gift_params)
		# redirect_to "/gifts/#{@gift[:id]}"
		redirect_to "/gifts"
	else
		flash.notice = "Must include a name and price!"
		render "/gifts/#{@gift[:id]}/edit"
	end
end

def show
	if !user_signed_in?
		redirect_to "/users/sign_in"
	end
	@gift = Gift.find(params[:id])
end

private

	def gift_params
		params.require(:gift).permit(:title, :price, :user_id, :friend_id)
	end

end
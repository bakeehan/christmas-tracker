class FriendsController < ApplicationController

def new
	if !user_signed_in?
		redirect_to "/users/sign_in"
	end
	@friend = Friend.new
end

def create
	@friend = Friend.new(friend_params)
	@friend.user_id = current_user.id
	if @friend.save
		redirect_to "/friends"
	else
		render "/friends/new"
	end
end

def index
	if !user_signed_in?
		redirect_to "/users/sign_in"
	end
	@friends = Friend.where(user_id: current_user.id)
end

def edit
	if !user_signed_in?
		redirect_to "/users/sign_in"
	end
	@friend = Friend.find(params[:id])
	if current_user != @friend.user
		redirect_to "/friends"
	end
end

def update
	@friend = Friend.find(params[:id])
	if @friend.update(friend_params)
		redirect_to "/friends/#{@friend[:id]}"
	else
		render "/friends/#{@friend[:id]}/edit"
	end
end

def show
	if !user_signed_in?
		redirect_to "/users/sign_in"
	end
	@friend = Friend(params[:id])
end

private

	def friend_params
		params.require(:friend).permit(:name, :user_id)
	end

end
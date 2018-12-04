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
	if !@friend.budget || !@friend.name
		flash.notice = "Must include a name and price!"
		render "/friends/new"
	elsif @friend.save
		redirect_to "/friends"
	else
		render "/friends/new"
	end
end

def index
	if !user_signed_in?
		redirect_to "/users/sign_in"
	end
	@friends = Friend.where(user: current_user)
end

def edit
	@friend = Friend.find(params[:id])
	if !user_signed_in? || @friend.user != current_user
		redirect_to "/users/sign_in"
	end
	if current_user != @friend.user
		redirect_to "/friends"
	end
end

def update
	@friend = Friend.find(params[:id])
	if @friend.update(friend_params)
		# redirect_to "/friends/#{@friend[:id]}"
		redirect_to "/friends"
	else
		render "/friends/#{@friend[:id]}/edit"
	end
end

def show
	if !user_signed_in?
		redirect_to "/users/sign_in"
	end
	@friend = Friend.find(params[:id])
end

private

	def friend_params
		params.require(:friend).permit(:name, :user_id, :budget)
	end

end
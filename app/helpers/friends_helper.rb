module FriendsHelper

	def check_possessive(buddy)
		@add_on = "'s"
		if buddy.name[buddy.name.length-1] == "s"
			@add_on = "'"
		end
		return @add_on
	end

end
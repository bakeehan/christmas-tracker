module HomeHelper

	def calc_total(user)
		budget = 0
		user.friends.each do |friend|
			budget += friend.budget
		end
		return budget
	end

	def calc_spent(person)
		spent = 0
		person.gifts.each do |gift|
			spent += gift.price
		end
		return spent
	end

	def calc_remaining(person, budget)
		budget -= calc_spent(person)
		return budget
	end

	def percent(friend, user)
		decimal = friend.budget.to_f / calc_total(user)
		return (decimal * 100)
	end

end
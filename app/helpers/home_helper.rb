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

end
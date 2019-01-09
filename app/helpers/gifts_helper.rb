module GiftsHelper

	def a_logic(thingie)
		@exceptions_a = ["hour","honor","honest","honorable","honored"]
		@exceptions_b = ["unique","union","ukelele","useful","useless","used"]
		@before_g = "a"
		if thingie.title.chr.to_i.to_s == thingie.title.chr
			@before_g = ""
		elsif ["a", "e", "i", "o", "u"].include?(thingie.title[thingie.title.chr]) && !@exceptions_b.include?(thingie.title.split(" ")[0]) || @exceptions_a.include?(thingie.title.split(" ")[0])
			@before_g = "an"
		end
		return @before_g
	end

end
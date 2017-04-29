class Hangman
	attr_accessor :name,:guessed,:correct_blank,:counter

	def initialize(password_name)
		@name = password_name.upcase
		@guessed = []
		@correct_blank = blank()
		@counter = 7
	end

	def correct_letter?(letter)
		 name.include?(letter)
	end
	def make_move(letter)
		if correct_letter?(letter)
		   correct_index(letter)
		else
			@counter-=1
		end
	end
	def charcount
		name.length
	end
	def blank()
		Array.new(charcount,"_")
	end
	def correct_letter?(letter)
		name.include?(letter)
	end
	def update_guessed(choice)
		guessed.push(choice)
	end
	def verified_guessed(letter)
		guessed.push(letter)
	end
	def correct_index(guessletter)
		password=name.split ("")
		password.each_with_index do |letter,index_position|
			if letter == guessletter
				correct_blank[index_position] =guessletter

			end

		end

	end
	def available_guessed(choice)
		if guessed.count(choice) == 0
		   true
		else
		   false
		end
	end
	def loser
		counter == 0
	end
	def winner
		p correct_blank
		if correct_blank.include?("_")
			false
		else
			true
		end
	end
end
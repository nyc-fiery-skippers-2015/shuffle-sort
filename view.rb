require_relative 'controller'

class View

	def self.display(input)
		puts input
	end

	def self.user_input
		gets.chomp
	end

	def self.correct
		puts "That's correct. Congrats!"
	end

	def self.wrong
		puts "Wrong answer. Try one more time."
	end

	def self.welcome
		puts "Welcome to ... flash card!"
	end

	def self.congrats
		puts "Congratulations! You guessed all questions correct!"
	end

	def done
		puts "Do you want to review wrong cards?"
	end

end

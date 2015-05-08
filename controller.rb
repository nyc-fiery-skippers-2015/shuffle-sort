require_relative "models/stack.rb"
require_relative "parser.rb"
require_relative "view.rb"
require 'pry'

class Controller
	attr_reader :test_stack, :file_name
	def initialize
		@test_stack=Stack.new(Parser.load('cards.csv'))
		run!
	end

	def look_at_cards
		input=""
		until input=="exit" || test_stack.stack_complete
			View.display(test_stack.gets_card_q)
			input=View.user_input
			if test_stack.correct?(input)
				View.correct
				test_stack.tag_correct
			else
				View.wrong
				input=View.user_input
				if test_stack.correct?(input)
					View.correct
					test_stack.tag_correct
					test_stack.next_card
				else
					View.wrong
				end
			
			end
			test_stack.next_card
		end
	end


	def run!
		View.welcome
		test_stack.shuffle
		look_at_cards
		# View.done
		# input=View.user_input
		# if input=="continue"

		# else
		# puts number_wrong
		   binding.pry
		Parser.save('cards.csv', test_stack.stack)

		View.congrats
	end


end


Controller.new
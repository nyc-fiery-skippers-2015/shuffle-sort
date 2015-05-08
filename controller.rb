require_relative "../stack.rb"
require_relative "../parser.rb"

class Controller
	attr_reader :test_stack :file_name
	def initialize(file_name)
		@test_stack=Stack.new(Parser.load(file_name))
		run!
	end

	def look_at_cards
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
				else
					View.wrong
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
		Parser.save(file_name, test_stack.stack)

		View.congrats
	end


end


Controller.new('cards.csv')
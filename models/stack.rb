class Stack
	attr_reader :stack
	attr_accessor :index
	def initialize(newcard_loader)
		@stack<<newcard_loader
		@index=0
	end

	def shuffle
		stack=stack.shuffle
	end

	def correct?(user_ans)
		stack[index].ans==user_ans
	end

	def start_over
		index=0
	end

	def add_card(ques_string, ans_string)
		stack << Card.new(ques_string, ans_string)
	end

	def delete_card(user_entered_card_numb)
		stack.delete_at(user_entered_card_numb.to_i-1)

	end

	def display_card_q
		current_card=stack[index]
		View.DISPLAY(current_card.question)
	end

	def display_card_a
		current_card=stack[index]
		View.DISPLAY(current_card.ans)
	end

	def next_card
		index+=1
	end
end

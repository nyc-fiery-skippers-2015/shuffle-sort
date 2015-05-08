require_relative "./card.rd"

class Stack
	attr_reader :stack
	attr_accessor :index
	def initialize(newcard_loader)
		@stack=newcard_loader
		@index=0
	end

	def shuffle
		stack=stack.shuffle
	end

	def correct?(user_ans)
		stack[index].answer.include?(user_ans)
	end

	def tag_correct
		stack[index].correct="correct"
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

	def gets_card_q
		current_card=stack[index].question
	end

	def gets_card_a
		current_card=stack[index].answer
	end

	def next_card
		index+=1
	end

	def gets
		stack
	end

	def stack_complete
		index==stack.length-1
	end

	def number_wrong
		stack.select {|x| x.correct}.count("correct")
	end

	def bad_stack
		stack.select {|card| card.correct=""}
	end
end

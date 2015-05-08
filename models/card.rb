class Card

  attr_reader :question, :answer, :id
  attr_accessor :correct

  def initialize(args = {})
    @question = args["question"]
    @answer = args["string"]
    @id = args[:id]
    @correct = args[:correct] || ""
  end

end


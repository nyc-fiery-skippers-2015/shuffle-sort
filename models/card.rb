class Card

  attr_reader :question, :answer, :id
  attr_accessor :correct

  def initialize(args = {})
    @question = args[:question]
    @answer = args[:answer]
    @id = args[:id]
    @correct = args[:correct] || ""
  end

end


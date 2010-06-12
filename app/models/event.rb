class Event < ActiveRecord::Base
  #has_many :questions
  attr_accessor :questions_text
  before_create :convert_text_to_questions
  before_create :convert_text_to_questions2  
  protected
  def convert_text_to_questions
    self.questions = @questions_text
    @questions_text.each do |e|
      puts "#{e} asdfasdf"
    end
  end

  def convert_text_to_questions2
    self.questions = @questions_text
    @questions_text.each do |e|
      puts "#{e}"
    end
  end
  
	def self.processQuestions
	
	end
end

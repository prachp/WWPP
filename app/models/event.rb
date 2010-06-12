class Event < ActiveRecord::Base
  has_many :questions
  has_many :attendees
  attr_accessor :questions_text
  #before_create :convert_text_to_questions
  #before_create :convert_text_to_questions2  
  after_create :convert_text_to_questions3
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
  
  def convert_text_to_questions3
    @questions_text = self.questions_text.split(/\n/)
    @questions_text.each do |text|
      if(!text.empty? && text!='\r')
       q = Question.new
       q.text = text
       q.event_id = self.id
       q.save
     end
    end
  end
    
  
end

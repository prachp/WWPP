class Event < ActiveRecord::Base
  has_many :questions
  has_many :attendees, :order => "id DESC"
  attr_reader :questions_text

  def questions_text=(text)
    @qt = text.split(/\n/)
    @qt.each do |text| 
      if (!Question.find_by_text(text) && !text.strip.empty?)
        @q = self.questions.create(:text => text)
        @q.save
        self.attendees.each do |attendee|
          puts "attendee ---- "
          puts @q.id
          attendee.answers.build(:question_id => @q.id, :answer => 0)
        end
      end
    end
  end
  
  def getQuestionsText
    @result = ""
    self.questions.each do |q|
      @result += q.text +
      "\n"
    end
    @result
  end
  
  def getBestResultId # might need to return sorted array or return all equal points, what do you think?
    @max = -1
    @best_question_id = 0
    self.questions.each do |q|
      @count = 0
      q.answers.each do |ans|
        if ans.answer == 3 # not sure about weight. Now, OK = 3 points, not sure 2, "X" and "-" zero
          @count += 2
        elsif ans.answer == 2
          @count += 1
        end
      end
      
      if @count > @max
        @max = @count
        @best_question_id = q.id
      end
  
    end
    
    @best_question_id
    
  end
  
end

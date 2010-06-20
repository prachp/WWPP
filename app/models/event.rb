class Event < ActiveRecord::Base
  has_many :questions
  has_many :attendees, :order => "id DESC"
  attr_reader :questions_text

  def questions_text=(text)
    @qt = text.split(/\n/)
    self.questions.each do |qs|
      if(!@qt.include? qs.text)
        qs.destroy
      end
    end
    @qt.each do |text| 
      if (self.id && !Question.find_by_text(text) && !text.strip.empty?)
        @q = self.questions.create(:text => text)
        @q.save
        self.attendees.each do |attendee|
          ans = attendee.answers.create(:question_id => @q.id, :answer => 0)
          ans.save
        end
      elsif (!self.id)
        self.questions.build(:text => text)
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
  
  def get_best_match 
    g = []
    self.questions.each do |q|
      count = 0
      q.answers.each do |ans|
        if ans.answer == 3 # not sure about weight. Now, OK = 3 points, not sure 2, "X" and "-" zero
          count += 2
        elsif ans.answer == 2
          count += 1
        elsif ans.answer == 1
          count -= 2
        end
      end
      g << [q.id,count]
    end
    g.sort! {|e1,e2| e2[1]-e1[1]}
    place = []
    score = g[0][1]
    d = []
    g.each do |e|
      if e[1] != score
        place << d
        d = [e[0]]
        score = e[1]
      else
        d << e[0]
      end
    end
    place << d
    answer = {}
    place.each_with_index do |e,i|
      e.each { |j| answer["#{j}"] = i}
    end
    answer
  end
  
end

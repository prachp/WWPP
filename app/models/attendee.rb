class Attendee < ActiveRecord::Base
  has_many :answers 
  belongs_to :event

  def answer_for(question)
    logger.info "question #{question.id}"
    @answer = self.answers.find(:first, :conditions => {:question_id => question.id})
    unless @answer
      @answer = self.answers.create(:answer => 0, :question_id=>question.id)
    end
    @answer
  end
end
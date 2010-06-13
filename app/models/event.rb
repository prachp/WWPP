class Event < ActiveRecord::Base
  has_many :questions
  has_many :attendees
  attr_accessor :questions_text
  after_create :convert_text_to_questions

  protected
  def convert_text_to_questions
    @questions_text = self.questions_text.split(/\n/)
    @questions_text.each do |text|
      self.questions.create(:text => text) unless text.strip.empty?
    end
  end
end

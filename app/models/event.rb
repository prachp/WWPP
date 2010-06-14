class Event < ActiveRecord::Base
  has_many :questions
  has_many :attendees, :order => "id DESC"
  attr_reader :questions_text

  def questions_text=(text)
    @qt = text.split(/\n/)
    @qt.each do |text|
      self.questions.build(:text => text) unless text.strip.empty?
    end
  end
end

class Question < ActiveRecord::Base
  has_many :answers, :order => "attendee_id"
  belongs_to :event
end

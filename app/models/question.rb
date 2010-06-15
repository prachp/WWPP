class Question < ActiveRecord::Base
  has_many :answers, :order => "attendee_id desc"
  belongs_to :event
end

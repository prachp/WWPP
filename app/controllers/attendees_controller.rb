class AttendeesController < ApplicationController

  def create
    @attendee = Attendee.new(params[:attendee])
    if @attendee.save
      @event =  Event.find(@attendee.event_id)
      # Create answers
      questions = Question.where(:event_id => @event.id)
      puts questions
      puts 'event.questions'
      puts @event.questions
      @event.questions.each do |q|
        answer = Answer.new(:question_id => q.id, :attendee_id => @attendee.id, :answer => 1)
        answer.save
      end

      redirect_to :action => "edit", :id => @attendee.id
    end
  end
  
  def edit
    @attendee = Attendee.find(params[:id])
    @event = Event.find(@attendee.event_id)
  end

end
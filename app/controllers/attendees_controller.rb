class AttendeesController < ApplicationController

  def create
    @attendee = Attendee.new(params[:attendee])
    @attendee.save
    @event =  Event.where(:id => @attendee.event_id)
    redirect_to :action => "edit", :id => @attendee.id
  end
  
  def edit
    @attendee = Attendee.find(params[:id])
    @event = Event.find(@attendee.event_id)
  end

end
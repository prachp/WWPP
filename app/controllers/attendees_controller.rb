class AttendeesController < ApplicationController

  def create
    @attendee = Attendee.new(params[:attendee])
    @attendee.save
    redirect_to :action=>:edit, :id=>@attendee.id
  end

  def edit
    @attendee = Attendee.find(params[:id])
    @event = Event.find(@attendee.event.id)
  end
  
  def update
    @attendee = Attendee.find(params[:id])
    respond_to do |format|
      if @attendee.update_attributes(params[:attendee])
        format.html { redirect_to(@attendee.event, :notice => 'Attendance was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attendee.errors, :status => :unprocessable_entity }
      end
    end
    
  end
end
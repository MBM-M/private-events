class EventAttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find(params[:event_id])
    unless current_user.attended_events.include?(event)
      current_user.attended_events << event
      flash[:notice] = "You are now attending the event"
    else
      flash[:alert] = "You are already attending this event"
    end
    redirect_to event_path(event)
  end
end

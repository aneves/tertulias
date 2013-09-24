class EventItemsController < ApplicationController
  before_filter :populate_event

  private
  def populate_event
    @event = Event.find[:event_name]
    redirect_to events_path if @event == nil
  end
end

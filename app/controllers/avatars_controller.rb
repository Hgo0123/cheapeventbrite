class AvatarsController < ApplicationController


	def create
    @event = Event.find(params[:event_id])
    @event.avatar.attach(params[:avatar])
    if @event.avatar.save
    	flash[:alert] = "Photo successfully added"
    redirect_to events_path
  end
  end

end

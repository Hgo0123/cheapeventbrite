class AvatarsController < ApplicationController


	def create
    @event = Event.new
    @event.avatar.attach(params[:avatar])
    if @event.avatar.save
    	flash[:alert] = "Photo successfully added"
    redirect_to events_path
  end
  end

end

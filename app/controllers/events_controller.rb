class EventsController < ApplicationController
	before_action :authenticate_user!, only: [:new]
	def index
		@event = Event.all
	end

	def new
		@new_event = Event.new
	end

	def create
		@user = current_user.id
		@new_event = Event.new('start_date' => params[:start_date], 'duration' => params[:duration], 'title' => params[:title], 'description' => params[:description], 'price' => params[:price], 'location' => params[:location], 'admin_id' => @user)
		if @new_event.save
			redirect_to root_path, alert: 'Votre événement a bien été créé'
		else
			render 'new'
		end
	end

	def show
		@event = Event.find(params[:id])
	end
end

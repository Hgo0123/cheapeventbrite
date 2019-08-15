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
	def edit
		@event_update = Event.find(params['id'])

	end

	def update
		@user = current_user
		@event_update = Event.find(params[:id])
		if @event_update.update('start_date' => params[:start_date], 'duration' => params[:duration], 'title' => params[:title], 'description' => params[:description], 'price' => params[:price], 'location' => params[:location], 'admin_id' => @user.id)
			redirect_to root_path, alert: 'Votre potin a bien été mis à jour'
		else
			render :edit
		end
	end

	def destroy
		@event_destroy = Event.find(params[:id])
		@event_destroy.destroy
		redirect_to root_path, alert: 'Votre potin a bien été supprimé, bravo !'
	end

	def show
		@event = Event.find(params[:id])
	end

	def subscribe
		@event = Event.find(params[:id])
		@attendance = Attendance.new(stripe_customer_id: params[:stripeToken], event: @event, user_id: current_user.id)


		if @event.users.include? current_user
			flash[:error] = "Vous participez deja a l'événement"
			redirect_to event_path(params[:id])
			return 
		end
		@amount = @event.price

		customer = Stripe::Customer.create({
			email: params[:stripeEmail],
			source: params[:stripeToken],
		})

		charge = Stripe::Charge.create({
			customer: customer.id,
			amount: @amount * 100,
			description: 'Rails Stripe customer',
			currency: 'eur',
		})

		if @attendance.save
			flash[:succes] = "Vous êtes bien inscit a l'événement"
			redirect_to event_path(params[:id])
		end

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end
	private
	def is_admin?
		@event.admin == current_user
	end

	def deja_participant?
		@event.users.include?(current_user) ? true : false
	end
end



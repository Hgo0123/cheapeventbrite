class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]
  def show
  	@user = current_user

  	@event = Event.all.where(admin: current_user.id)

  end

  def edit

  end

  def update
  	if current_user.update('first_name' => params[:first_name], 'last_name' => params[:first_name])
  		redirect_to users_show_path, alert: 'Profil updated'
  	else 
  		render 'edit'
  	end
  end
end

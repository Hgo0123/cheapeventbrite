class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :user_signed_in?, only: [:edit]
  def show
  	@user = User.find(params[:id])

  	@event = Event.all.where(admin: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy

  end

  

  def update
    @user = current_user
    if @user.update('first_name' => params[:first_name], 'last_name' => params[:last_name])
      redirect_to user_path(current_user.id), alert: 'Profil updated'
    else 
      render 'edit'
    end
  end

end


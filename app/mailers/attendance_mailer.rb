class AttendanceMailer < ApplicationMailer
default from: 'no-reply@monsite.fr'

	  def welcome_attendees(attendance)

  	@event = Event.find(id: attendance.event_id).admin_id

  	@user = User.where(id: @event).email

  	# @admin = Event.where(id: @event).admin_id
  	# @user = User.where(id: @admin)
  	puts "######‡‡‡‡‡‡‡‡‡‡‡‡"
  	puts @event
  

  # 	@url = 'http://monsite.fr/login' 

		# mail(to: @admin.email, subject: 'Un nouveau participant !')  	

  end
end

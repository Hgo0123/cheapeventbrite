class AttendanceMailer < ApplicationMailer
default from: 'no-reply@monsite.fr'

	  def welcome_attendees(attendance)

  	attendance = Attendance.last.event_id

  	event = Event.where(id: attendance)
  
  	event = event[0].admin_id

  	user = User.where(id: event)

  	@url = 'http://monsite.fr/login' 

		 mail(to: @user.email, subject: 'Un nouveau participant !')  	

  end
end


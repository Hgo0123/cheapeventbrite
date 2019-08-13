class AttendanceMailer < ApplicationMailer
default from: 'no-reply@monsite.fr'

	  def welcome_attendees(attendance)

  	attendance = Attendance.last

  	@admin = attendance.event.admin
  	

  	@url = 'http://monsite.fr/login' 

		 mail(to: @admin.email, subject: 'Un nouveau participant !')  	

  end
end


class Attendance < ApplicationRecord
	after_create :welcome_attendees_send

	belongs_to :user
	belongs_to :event

	def welcome_attendees_send

		AttendanceMailer.welcome_attendees(self).deliver_now

	end



end

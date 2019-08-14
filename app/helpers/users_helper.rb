module UsersHelper
		def deja_participant?
      @attendance = Attendance.where(event_id: params[:id])
       if @attendance.user_id == current_user.id
       	return true
       else
       	return false
       end
    end
end

module ApplicationHelper
	def avatar_for(user)
    @avatar = current_user.avatar
    if @avatar.empty?
        @avatar_user = image_tag("user.png")
    else
        @avatar_user = image_tag(@avatar)
    end
    return @avatar_user
end
end

module ApplicationHelper
  #   def exists(calendar)
  #     if calendar.user_calendars.where(calendar.user_id => current_user.id).blank?
  #       true
  #     else
  #       false
  #     end
  # end
  def creator?(calendar)
    #   if exists(calendar)
    # cal = calendar.find(calendar.id, calendar.id)
    # userID = calendars.find(@calendar.user_id = object.id).user_id
    # t=c2.user_calendars.find(user_id =1)
    c = @calendar.user_calendars.where(user_id: Current.user.id)
    c.first.creator
  end
end

module ApplicationHelper
  def creator?(_calendar)
    c = @calendar.user_calendars.where(user_id: Current.user.id)
    c.first.creator
  end
end

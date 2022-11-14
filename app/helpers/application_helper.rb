module ApplicationHelper

  def creator?(calendar)
    c = @calendar.user_calendars.where(user_id: Current.user.id)
    c.first.creator
  end

  def owner?(user_calendar)
    
  end
end

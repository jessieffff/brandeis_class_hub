module ApplicationHelper

  def creator?(calendar)
    c = @calendar.user_calendars.where(user_id: current_user.id)
    c.first.creator
  end

  def calendar_ids(user)
    #do this later
  end
end

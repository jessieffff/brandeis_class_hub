module ApplicationHelper
  def creator?(_calendar)
    c = @calendar.user_calendars.where(user_id: Current.user.id)
    c.first.creator
  end

  def creatorname(_calendar)
    u = @calendar.user_id
    user = User.find_by(id: u)
    user.first_name + ' ' + user.last_name
  end

  def calendar_ids(user)
    #do this later
  end
end

module ApplicationHelper

  def creator?(calendar)
    c = @calendar.user_calendars.where(user_id: Current.user.id)
    c.first.creator
  end

  def calendar_ids(user)
    #do this later
  end

  def flash_class(level)
    case level
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :danger then "alert alert-danger" 
      when :alert then "alert alert-warning"
    end
  end

end

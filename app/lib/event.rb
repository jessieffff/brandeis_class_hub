class Event
    def self.getURL(event, paths)
        if (event.is_a? Holiday)
            "#{paths[:calendar]}/#{Calendar.find_by(id: event.calendar_id).invite_token}/#{'holidays'}/#{event.slug}"
        elsif (event.is_a? Assignment)
            "#{paths[:calendar]}/#{Calendar.find_by(id: event.calendar_id).invite_token}/#{'courses'}/#{Course.find_by(id: event.course_id).slug}/#{'assignments'}/#{event.slug}"
        elsif (event.is_a? ClassPeriod)
            "#{paths[:calendar]}/#{Calendar.find_by(id: event.calendar_id).invite_token}/#{'courses'}/#{Course.find_by(id: event.course_id).slug}/#{'class_periods'}/#{event.id}"
        else
            "#{paths[:calendar]}/#{Calendar.find_by(id: event.calendar_id).invite_token}/#{'other_events'}/#{event.slug}"
        end
    end

    def self.getColor(event)
        if (event.is_a? Holiday)
            'holidayEvent'
        elsif (event.is_a? Assignment)
            'assignmentEvent'
        elsif (event.is_a? ClassPeriod)
            'classPeriodEvent'
        else
            'otherEvent'
        end
    end

    def self.getRange(view)
        if (view == 'day')
            0..-1
        else
            0..1
        end
    end
end
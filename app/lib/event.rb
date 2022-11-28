class Event
    def self.getURL(event, paths)
        if (event.is_a? Holiday)
            "#{paths[:holiday]}/#{event.id}"
        elsif (event.is_a? Assignment)
            "#{paths[:assignment]}/#{event.id}"
        elsif (event.is_a? ClassPeriod)
            "#{paths[:class_period]}/#{event.id}"
        else
            "#{paths[:other_event]}/#{event.id}"
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
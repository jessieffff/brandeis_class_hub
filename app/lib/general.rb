class General
    #Adds a 0 to start of number if under 10
    def self.format(num)
        if (num < 10)
            return "0#{num}"
        else
            return num
        end
    end

    def self.getPath(event)
        if (event.is_a? Holiday)
            "#{holidays_url}/#{event.id}"
        elsif (event.is_a? Assignment)
            "#{assignments_url}/#{event.id}"
        elsif (event.is_a? ClassPeriod)
            "#{class_period_url}/#{event.id}"
        else
            "#{other_events_url}/#{event.id}"
        end      
    end
end
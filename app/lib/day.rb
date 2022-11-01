class Day

    attr_accessor :day

    def initialize(year, month, day)
        @day = day
        @month = month
        @year = year
        @today = Date.new(@year, @month, @day)
    end

    def load_events
        today_events = Holiday.all.where(date: @today.all_day) +
                        OtherEvent.all.where(start_time: @today.all_day) +
                        ClassPeriod.all.where(start_time: @today.all_day) +
                        Assignment.all.where(due_date: @today.all_day)
        return today_events
    end

    def currentDate
        return "#{@month}/#{@day}/#{@year}"
    end

    def next
        next_day = @today.next_day
        if (next_day.month < 10)
            month_string = "0#{next_day.month}"
        else
            month_string = "#{next_day.month}"
        end

        if (next_day.day < 10)
            day_string = "0#{next_day.day}"
        else
            day_string = "#{next_day.day}"
        end
        return "#{month_string}#{day_string}#{next_day.year}"
    end

    def prev
        prev_day = @today.prev_day
        if (prev_day.month < 10)
            month_string = "0#{prev_day.month}"
        else
            month_string = "#{prev_day.month}"
        end

        if (prev_day.day < 10)
            day_string = "0#{prev_day.day}"
        else
            day_string = "#{prev_day.day}"
        end
        return "#{month_string}#{day_string}#{prev_day.year}"
    end
    
end
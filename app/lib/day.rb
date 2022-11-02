#Day PORO by David Shapiro
class Day

    attr_accessor :day

    def initialize(year, month, day)
        @day = day
        @month = month
        @year = year
        @today = Date.new(@year, @month, @day)
    end

    def load_events
        #load each type of event
        today_events = Holiday.all.where(date: @today.all_day) +
                        OtherEvent.all.where(start_time: @today.all_day) +
                        ClassPeriod.all.where(start_time: @today.all_day) +
                        Assignment.all.where(due_date: @today.all_day)
        return today_events
    end

    #Get date in traditional format
    def currentDate
        return "#{@month}/#{@day}/#{@year}"
    end

    #Returns date of next day for url
    def next
        next_day = @today.next_day
        month_string = General.format(next_day.month)
        day_string = General.format(next_day.day)
        return "#{month_string}#{day_string}#{next_day.year}"
    end

    #Returns date of prev day for url
    def prev
        prev_day = @today.prev_day
        month_string = General.format(prev_day.month)
        day_string = General.format(prev_day.day)
        return "#{month_string}#{day_string}#{prev_day.year}"
    end
    
end
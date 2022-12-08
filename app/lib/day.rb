#Day PORO by David Shapiro
class Day

    attr_accessor :day

    def initialize(year, month, day, user_id)
        @day = day
        @month = month
        @year = year
        @today = Date.new(@year, @month, @day)
        @user_id = user_id
    end

    def load_events
        today_events = []
        calendars = UserCalendar.where(user_id: @user_id)
        calendars.each do |cal|
            today_events = today_events +
                        Holiday.all.where(date: @today.all_day, calendar_id: cal.calendar_id) +
                        OtherEvent.all.where(date: @today.all_day, calendar_id: cal.calendar_id) +
                        ClassPeriod.all.where(date: @today.all_day, calendar_id: cal.calendar_id) +
                        Assignment.all.where(due_date: @today.all_day, calendar_id: cal.calendar_id)
        end
        return today_events
    end

    #Get date in year month day format
    def currentDate
        return "#{@year}/#{@month}/#{@day}"
    end

    def params_date
        return "#{@year}-#{@month}-#{@day}"
    end

    def display_date
        return "#{day_of_week} #{Date::MONTHNAMES[@month]} #{@day}"
    end
    
    def day_of_week
        day_to_name = {0 => "Sunday", 1 => "Monday", 2 => "Tuesday", 3 => "Wednesday", 4 => "Thursday", 5 => "Friday",
                       6 => "Saturday"}
        return day_to_name[@today.wday]
    end

    #Returns date of next day for url
    def next
        next_day = @today.next_day
        month_string = General.format(next_day.month)
        day_string = General.format(next_day.day)
        return "#{next_day.year}-#{month_string}-#{day_string}"
    end

    #Returns date of prev day for url
    def prev
        prev_day = @today.prev_day
        month_string = General.format(prev_day.month)
        day_string = General.format(prev_day.day)
        return "#{prev_day.year}-#{month_string}-#{day_string}"
    end
    
end
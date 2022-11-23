#Week Poro by David Shapiro
class Week

    attr_accessor :days_in_week

    def initialize(start_date)
        @start_date = start_date
        @days_in_week = getLengthOfWeek(@start_date)
        @month = @start_date.month
        @day = @start_date.day
        @year = @start_date.year
        @days = []
    end

    def load_week
        #loads nil in starting positions if not full week in month
        if (@start_date.day < 22)
            for a in 0...(7 - @days_in_week)
                @days.push(nil) 
            end
        end
        
        #loads each day
        for a in 0...@days_in_week do
            day = Day.new(@start_date.year, @start_date.month, @start_date.day + a)
            @days.push(day)
        end

        #loads nil at end if not full week in month
        if (@start_date.day > 22)
            for a in 0...(7 - @days_in_week)
                @days.push(nil) 
            end
        end

        return @days
    end

    def next
        #Shifts to find Sunday of next week
        next_week = @start_date.next_day.next_week.prev_day

        #Next Week is start of new month
        if (next_week.month > @start_date.month || (next_week.month == 1 && @start_date.month == 12))
            next_week = Date.new(next_week.year, next_week.month, 01)
        end

        month_string = General.format(next_week.month)
        day_string = General.format(next_week.day)
        return "#{next_week.year}-#{month_string}-#{day_string}"
    end

    def prev
        #Shifts to find the start of the week
        start_of_week = @start_date.prev_week.next_week.prev_day;

        #Get start of last week of prev month
        if @start_date.day == 1
            prev_week = start_of_week

        #Load weeks starting with 1st of month
        elsif start_of_week.month < @start_date.month
            prev_week = Date.new(@start_date.year, @start_date.month, 01)
        #Otherwise prev week in same month
        else
            prev_week = @start_date.next_day.prev_week.prev_day
        end

        month_string = General.format(prev_week.month)
        day_string = General.format(prev_week.day)
        return "#{prev_week.year}-#{month_string}-#{day_string}"
    end

    #Finds the length of week with certain day
    def getLengthOfWeek(date)
        month = date.month
        year = date.year
        day = date.day

        #First and last days
        first_of_month = Date.new(year, month, 01)
        last_of_month = Date.new(year, month, -1)

        #Find length of first and last week
        len_first_week = 7 - first_of_month.wday
        len_last_week = (last_of_month.day - len_first_week) % 7

        #Day is in first week
        if (day <= len_first_week)
            return len_first_week

        #Day is in last week
        elsif (day >= last_of_month.day - len_last_week)
            return len_last_week
        
        #Day is in middle week
        else
            return 7
        end
    end

    #Current week
    def current
        month_string = General.format(@month)
        day_string = General.format(@day)
        return "#{@year}-#{month_string}-#{day_string}"
    end
        
end
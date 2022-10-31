class Week

    attr_accessor :days_in_week

    def initialize(start_date, days_in_week)
        @start_date = start_date
        @days_in_week = days_in_week
        @days = []
    end

    def load_week
        if (@start_date.day < 22)
            for a in 0...(7 - @days_in_week)
                @days.push(nil) 
            end
        end
        
        for a in 0...@days_in_week do
            day = Day.new(@start_date.year, @start_date.month, @start_date.day + a)
            @days.push(day)
        end

        if (@start_date.day > 22)
            for a in 0...(7 - @days_in_week)
                @days.push(nil) 
            end
        end

        return @days
    end

    #def next
    #    last_day_month = Date.new(@start_date.year, @start_date.month, -1)
    #    if (@start_date.day + days_in_week > last_day_month.day)
    #        if (@start_date.month == 12)
    #            return "0101#{@start_date.year + 1}"
    #        elsif (@start_date.month < 9)
    #            return "0#{@start_date.month + 1}01#{@start_date.year}"
    #        else
    #            return "#{@start_date.month + 1}01#{@start_date.year}"
    #        end
    #    else
    #        if ((@start_date.day + days_in_week) < 10)
    #            day_num = "0#{@start_date.day + days_in_week}"
    #        else
    #            day_num = "#{@start_date.day + days_in_week}"
    #        end
    #        if (@start_date.month < 9)
    #            return "0#{@start_date.month}#{day_num}#{@start_date.year}"
    #        else
    #            return "#{@start_date.month}#{day_num}#{@start_date.year}"
    #       end
    #    end
    #end

    def next
        next_week = @start_date.next_day.next_week.prev_day
        if (next_week.month < 10)
            month_string = "0#{next_week.month}"
        else
            month_string = "#{next_week.month}"
        end

        if (next_week.day < 10)
            day_string = "0#{next_week.day}"
        else
            day_string = "#{next_week.day}"
        end
        return "#{month_string}#{day_string}#{next_week.year}"
    end

    def prev
        start_of_week = @start_date.prev_week.next_week.prev_day;
        if start_of_week.month < @start_date.month
            prev_week = start_of_week
        else
            prev_week = @start_date.prev_week.prev_day
        end
        if (prev_week.month < 10)
            month_string = "0#{prev_week.month}"
        else
            month_string = "#{prev_week.month}"
        end
        if (prev_week.day < 10)
            day_string = "0#{prev_week.day}"
        else
            day_string = "#{prev_week.day}"
        end
        return "#{month_string}#{day_string}#{prev_week.year}"
    end

    def self.getLengthOfWeek(date)
        month = date.month
        year = date.year
        day = date.day
        first_of_month = Date.new(year, month, 01)
        last_of_month = Date.new(year, month, -1)
        len_first_week = 7 - first_of_month.wday
        len_last_week = (last_of_month.day - len_first_week) % 7
        if (day <= len_first_week)
            return len_first_week
        elsif (day >= last_of_month.day - len_last_week)
            return len_last_week
        else
            return 7
        end
    end
        
end
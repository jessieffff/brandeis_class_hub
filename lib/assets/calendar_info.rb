require 'date'

class CalendarInfo

    TOTAL_DAYS_ON_CAL = 42

    def initialize(month, year)
        set_month(month)
        set_year(year)
    end

    def set_month(month)
        @month = month
    end
    
    def set_year(year)
        @year = year
    end

    def get_dates
        currentDate = 1
        d_first = Date.new(@year, @month, 01)
        d_last = Date.new(@year, @month, -1)
        start_day_of_week = d_first.wday
        dates = Array.new(start_day_of_week)

        #Load all dates
        while (currentDate <= d_last.day)
            dates.push(currentDate)
            currentDate += 1
        end

        #Finish off calendar
        (TOTAL_DAYS_ON_CAL - dates.length()).times do
            dates.push(nil)
        end
        return dates
    end

    def get_days_of_week()
        return ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    end

    def get_month_name(num)
        num_to_names = {1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June",
                        7 => "July", 8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December"};
        return num_to_names[num]
    end

end


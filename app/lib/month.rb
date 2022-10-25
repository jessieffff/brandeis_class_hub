class Month
    def initialize(month, year)
        @month = month
        @year = year
        @first_of_month = Date.new(@year, @month, 01)
        @last_of_month = Date.new(@year, @month, -1)
    end

    def load_month
        weeks = []
        start_day = 1 #First of month

        days_in_month = @last_of_month.day
        num_days_in_first_week = 7 - @first_of_month.wday
        num_days_in_last_week = (days_in_month - num_days_in_first_week) % 7
        num_inner_weeks = (days_in_month - num_days_in_first_week - num_days_in_last_week) / 7
        
        first_week = Week.new(make_date(01), num_days_in_first_week)
        weeks.push(first_week)
        start_day += num_days_in_first_week

        while num_inner_weeks > 0
            weeks.push(Week.new(make_date(start_day), 7))
            num_inner_weeks -= 1
            start_day += 7
        end

        last_week = Week.new(make_date(start_day), num_days_in_last_week)
        weeks.push(last_week)
        return weeks
    end

    def make_date(day)
        d = Date.new(@year, @month, day)
        return d
    end

    def get_month_year()
        return "#{@month}, #{@year}"
    end

end
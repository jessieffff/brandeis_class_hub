#Month PORO by David Shapiro
class Month

    attr_accessor :month
    attr_accessor :year

    def initialize(month, year)
        @month = month
        @year = year
        @first_of_month = Date.new(@year, @month, 01)
        @last_of_month = Date.new(@year, @month, -1)
    end

    def load_month(user_id)
        weeks = []
        start_day = 1 #First of month

        #Important info about month
        days_in_month = @last_of_month.day
        num_days_in_first_week = 7 - @first_of_month.wday
        num_days_in_last_week = (days_in_month - num_days_in_first_week) % 7
        num_inner_weeks = (days_in_month - num_days_in_first_week - num_days_in_last_week) / 7
        
        #Load first week
        first_week = Week.new(make_date(01))
        weeks.push(first_week)
        start_day += num_days_in_first_week

        #load inner weeks
        while num_inner_weeks > 0
            weeks.push(Week.new(make_date(start_day)))
            num_inner_weeks -= 1
            if (start_day + 7 < @last_of_month.day)
                start_day += 7
            end
        end

        #load final week
        last_week = Week.new(make_date(start_day))
        weeks.push(last_week)
        return weeks
    end

    def make_date(day)
        d = Date.new(@year, @month, day)
        return d
    end

    #Get the month name followed by year
    def get_month_year
        return "#{month_name @month} #{@year}"
    end

    def next
        #New year
        if (@month == 12)
            return "#{@year + 1}-01-01"
        #same year
        else
            month_string = General.format(@month + 1)
            return "#{@year}-#{month_string}-01"
        end
    end

    def prev
        #Going back a year
        if (@month == 1)
            return "#{@year - 1}-12-01"
        #same year
        else
            month_string = General.format(@month - 1)
            return "#{@year}-#{month_string}-01"
        end
    end

    #current month string
    def current
        month_string = General.format(@month)
        return "#{@year}-#{month_string}-01"
    end

    #go from month num to name
    def month_name(month)
        num_to_month = {1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May",
                        6 => "June", 7 => "July", 8 => "August", 9 => "September", 10 => "October",
                        11 => "November", 12 => "December"}
        return num_to_month[month]
    end



end
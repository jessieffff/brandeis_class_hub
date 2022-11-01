class Month

    attr_accessor :month
    attr_accessor :year

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
        
        first_week = Week.new(make_date(01))
        weeks.push(first_week)
        start_day += num_days_in_first_week

        while num_inner_weeks > 0
            weeks.push(Week.new(make_date(start_day)))
            num_inner_weeks -= 1
            if (start_day + 7 < @last_of_month.day)
                start_day += 7
            end
        end

        last_week = Week.new(make_date(start_day))
        weeks.push(last_week)
        return weeks
    end

    def make_date(day)
        d = Date.new(@year, @month, day)
        return d
    end

    def get_month_year()
        return "#{month_name @month} #{@year}"
    end

    def next
        if (@month == 12)
            return "0101#{@year + 1}"
        elsif (@month < 9)
            return "0#{@month + 1}01#{@year}"
        else
            return "#{@month + 1}01#{@year}"
        end
    end

    def prev
        if (@month == 1)
            return "1201#{@year - 1}"
        else
            new_month = @month - 1
            if (new_month <= 9)
                return "0#{new_month}01#{@year}"
            else
                return "#{new_month}01#{@year}"
            end
        end
    end

    def current
        if (@month <= 9)
            return "0#{@month}01#{@year}"
        else
            return "#{@month}01#{@year}"
        end
    end

    def month_name(month)
        num_to_month = {1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May",
                        6 => "June", 7 => "July", 8 => "August", 9 => "September", 10 => "October",
                        11 => "November", 12 => "December"}
        return num_to_month[month]
    end



end
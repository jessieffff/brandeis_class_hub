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
end
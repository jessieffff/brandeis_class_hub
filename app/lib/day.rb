class Day

    attr_accessor :day

    def initialize(year, month, day)
        @day = day
        @month = month
        @year = year
        @today = Date.new(@year, @month, @day)
    end

    def load_events
        today_events = OtherEvent.all.where(start_time: @today)
        return today_events.sort()
    end

    def currentDate
        return "#{@month}/#{@day}/#{@year}"
    end
    
end

Assignment.create(calendar_id: Faker::Number.number(digits: 1), assignment_name: Faker::Lorem.word, due_date: Faker::Time.forward(days: 7, period: :evening), course_id: Faker::Number.number(digits: 1))
class CalendarHelper

    def self.generate_class_period(freq, name, id, start_date, end_date, start_time, end_time, calendar_id)
        all_params = []
        day_to_num = {'U' => 0, 'M' => 1, 'T' => 2, 'W' => 3, "H" => 4, 'F' => 5, "S" => 6}
        num_to_day = {0 => 'U', 1 => 'M', 2 => 'T', 3 => 'W', 4 => 'H', 5 => 'F', 6 => 'S'}
        day_to_symbol = {'U' => :sunday, 'M' => :monday, 'T' => :tuesday, 'W' => :wednesday, 'H' => :thursday, 'F' => :friday, 'S' => :saturday}
        initial_days = []
        current_date = start_date

        for increase in 0...7 do
            if (current_date <= end_date)
                if (freq.include?(num_to_day[current_date.wday]))
                    initial_days.push(current_date)
                end
            end
            current_date = current_date + 1
        end
        
        initial_days.each do |day_of_week|
            current = day_of_week
            while (current <= end_date)
                params = {name: name, course_id: id,
                         start_time: start_time, end_time: end_time,
                         date: current, calendar_id: calendar_id}
                ClassPeriod.create(params)
                current = current + 7
                all_params.push(params);
            end
    
        end

        return all_params;
    end

    def self.load_calendars(user_id)
        Calendar.all.where(user_id: user_id).collect { |calendar| [calendar.name, calendar.id]}
    end

    def self.load_courses(user_id)
        calendars = UserCalendar.where(user_id: user_id)
        all_courses = []
        calendars.each do |cal|
            all_courses += Course.all.where(calendar_id: cal.calendar_id).collect { |course| [course.name, course.id, course.calendar_id, course.slug, course.start_date, course.end_date, course.professor_name]}
        end
        return all_courses

    end

    def self.load_holidays(user_id)
        calendars = UserCalendar.where(user_id: user_id)
        all_holidays = []
        calendars.each do |cal|
            all_holidays += Holiday.all.where(calendar_id: cal.calendar_id).collect { |holiday| [holiday.name, holiday.date, holiday.calendar_id, holiday.slug, holiday.holiday_type]}
        end
        return all_holidays
    end

    def self.load_assignments(user_id)
        calendars = UserCalendar.where(user_id: user_id)
        all_assignments = []
        calendars.each do |cal|
            all_assignments += Assignment.all.where(calendar_id: cal.calendar_id).collect { |assignment| [assignment.id, assignment.name, assignment.due_date, assignment.course_id, assignment.slug, assignment.calendar_id]}
        end
        return all_assignments   

    end

    def self.load_other_events(user_id)
        calendars = UserCalendar.where(user_id: user_id)
        all_other_events = []
        calendars.each do |cal|
            all_other_events += OtherEvent.all.where(calendar_id: cal.calendar_id).collect { |other_event| [other_event.id, other_event.name, other_event.date, other_event.start_time, other_event.end_time, other_event.calendar_id, other_event.slug]}
        end
        return all_other_events   

    end
end
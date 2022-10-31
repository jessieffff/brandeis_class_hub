class HomeController < ApplicationController
    def calendar
        if params[:date] != nil
            @m = params[:date][0, 2].to_i
            @d = params[:date][2, 2].to_i
            @y = params[:date].last(4).to_i
        else
            @m = 1
            @d = 1
            @y = 2022
        end
        @month = Month.new(@m, @y)
        date = Date.new(@y, @m, @d)
        @week  = Week.new(date, Week.getLengthOfWeek(date))
        if params[:view] != nil
            @view = params[:view]
        else
            @view = :month
        end
    end
end
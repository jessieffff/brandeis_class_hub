class HomeController < ApplicationController
    def calendar

        if params[:datepicker] != nil
            @y = params[:datepicker].split("-")[0].to_i
            @m = params[:datepicker].split("-")[1].to_i
            @d = params[:datepicker].split("-")[2].to_i
        elsif params[:date] != nil
            @m = params[:date][0, 2].to_i
            @d = params[:date][2, 2].to_i
            @y = params[:date].last(4).to_i
    
        else
            @m = Date.today.month
            @d = 01
            @y = Date.today.year
        end
        @month = Month.new(@m, @y)
        date = Date.new(@y, @m, @d)
        @week  = Week.new(date)
        @day = Day.new(@y, @m, @d)
        if params[:view] != nil
            @view = params[:view]
        else
            @view = "month"
        end
        @nav_item_day  = "nav-item #{"active" if @view == 'day'}"
        @nav_item_week = "nav-item #{"active" if @view == 'week'}"
        @nav_item_month = "nav-item #{"active" if (@view == 'month' || @view == nil)}"
    end
end
class HomeController < ApplicationController
    before_action :logged_in_user
    def calendar
        if params[:date] != nil
            @y = params[:date].split("-")[0].to_i
            @m = params[:date].split("-")[1].to_i
            @d = params[:date].split("-")[2].to_i
        else
            @y = Date.today.year
            @m = Date.today.month
            @d = 01
        end
        @month = Month.new(@m, @y)
        date = Date.new(@y, @m, @d)
        @week  = Week.new(date)
        @day = Day.new(@y, @m, @d, current_user[:id])
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
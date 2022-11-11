class HomeController < ApplicationController
    before_action :logged_in_user
    def calendar
        if params[:date] != nil
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
            @view = :month
        end
    end

          # Confirms a logged-in user.
  def logged_in_user
    unless logged_in? 
      flash[:danger] = 'Please log in.'
      redirect_to login_url, status: :see_other
    end
  end
end
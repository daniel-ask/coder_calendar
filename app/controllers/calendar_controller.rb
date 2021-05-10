class CalendarController < ApplicationController
  def calendar
    start_date = params.fetch(:start_date, Date.today).to_date
    @meetings = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def list
    @events = Event.all.order(:start_time)
  end
end

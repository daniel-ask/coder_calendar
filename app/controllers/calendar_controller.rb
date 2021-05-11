class CalendarController < ApplicationController
  def calendar
    start_date = params.fetch(:start_date, Date.today).to_date
    @events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def list
    @events = Event.all.order(:start_time)
  end
  

  def lightning_talks
    Event.destroy_all
    names = %w[
      Yannick
      Sainath
      Mark
      Deeon
      Vanessa
      Karen
      Murphy
      Joanna
      Peter
      Kim
      Alice
      Dean
      Ananda
      Matthew
      Jackie
      Suz
      Chris
      Jordan
      Ryan
    ]
    start_time = DateTime.parse('17-05-2021 14:00')
    end_time = DateTime.parse('17-05-2021 14:10')
    until names.empty?
      unless start_time.between?(DateTime.parse('05-06-2021'), DateTime.parse('13-06-2021'))
        student = names.sample
        Event.create(name: "#{student}'s Lightning Talk", start_time: start_time, end_time: end_time)
        names.delete(student)
        student2 = names.sample
        unless student2.nil?
          Event.create(name: "#{student2}'s Lightning Talk", start_time: start_time + 2.days,
                       end_time: end_time + 2.days)
        end
        names.delete(student2)
      end
      start_time += 1.week
      end_time += 1.week
    end

    redirect_to root_path
  end
end

module ApplicationHelper
  def simple_date(date)
    unless date.nil?
      date.localtime.strftime('%m/%d/%Y %I:%M %p')
    end
  end

  def simple_date_no_time(date)
    unless date.nil?
      date.localtime.strftime('%m/%d/%Y')
    end
  end
end
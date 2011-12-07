module ApplicationHelper
  def simple_date(date)
    date.localtime.strftime('%m/%d/%Y @ %I:%M %p')
  end
end

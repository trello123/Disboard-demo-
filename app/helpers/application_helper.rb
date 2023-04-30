module ApplicationHelper
  def format_date(date)
    date.strftime("%Y/%-m/%-d # %I:%M %p")
  end
end

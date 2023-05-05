module ApplicationHelper
  def format_datetime(date)
    date.strftime("%Y/%-m/%-d # %I:%M %p")
  end
  

  def format_email(email)
    email.split("@").first
  end
end

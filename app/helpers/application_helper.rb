module ApplicationHelper
  def format_datetime(datetime)
    datetime.strftime("%Y/%-m/%-d %H:%M")
  end

  def format_date(date)
    date.strftime("%Y/%-m/%-d")
  end

  def format_time(time)
    time.strftime("%H:%M")
  end

  def format_date_to_month_and_day(date)
    date.strftime("%-m月%-d日")
  end

  def format_email(email)
    email.split("@").first
  end

  def select_container(board)
    board.containers.pluck(:title, :id)
  end 

  def assign_user(board)
    board.users.pluck(:email, :email).unshift(["尚未指派","尚未指派"])
  end

  def find_user_email(card)
    User.find(card).email
  end
end

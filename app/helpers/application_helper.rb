module ApplicationHelper
  def format_timestamps(timestamps, format = nil)
    case format
    when :date
      timestamps.strftime("%Y/%-m/%-d")
    when :time
      timestamps.strftime("%H:%M")
    when :month_and_day
      timestamps.strftime("%-m月%-d日")
    else
      timestamps.strftime("%Y/%-m/%-d %H:%M")
    end
  end

  def format_email(email)
    email.split("@").first
  end

  def select_container(board)
    board.containers.pluck(:title, :id)
  end 

  def assign_user(board)
    board.users.pluck(:username, :username).unshift(["尚未指派","尚未指派"])
  end

  def find_user_email(card)
    User.find(card).email
  end
end

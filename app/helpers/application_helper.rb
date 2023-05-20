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

  def user_email(email)
    email.split("@").first
  end

  def assign_user(board)
    board.users.pluck(:email, :email).unshift(["尚未指派","尚未指派"])
  end
end

module ApplicationHelper
  def format_datetime(date)
    date.strftime("%Y/%-m/%-d # %I:%M %p")
  end
  

  def format_email(email)
    email.split("@").first
  end

  def select_container(board)
    board.containers.pluck(:title, :id)
  end 

  def assign_user(board)
    board.users.pluck(:email, :id).unshift(["尚未指派","尚未指派"])
  end

  def find_user_email(card)
    User.find(card).email
  end
end

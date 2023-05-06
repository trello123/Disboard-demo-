module BoardsHelper
  def group_cards(card, column)
    card.group(column).count 
  end 

  def group_cards_status(container, column)
    container.joins(:cards).group(:position, column).count
  end

  def card_assigned_status(user, column)
    user.joins(:boards).includes(:cards).group(:username, column).count
  end
end

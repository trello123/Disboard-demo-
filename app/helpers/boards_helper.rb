module BoardsHelper
  def group_cards(card, column)
    card.group(column).count 
  end 

  def group_cards_status(container, column)
    container.joins(:cards).group(:position, column).count.transform_keys { |k| "#{k[1]}" }
  end

  def calculate_done_cards(card, container, column)
    if group_cards_status(container, column)["已完成"].present?
      "#{(group_cards_status(container, column)["已完成"] / (card.count * 1.0) * 100).round(1)}#{"%"}"
    else
      "-"
    end
  end

  ##暫時留著，之後可能要用到
  def card_assigned_status(user, column)
    user.joins(:boards).includes(:cards).group(:username, column).count
  end
end

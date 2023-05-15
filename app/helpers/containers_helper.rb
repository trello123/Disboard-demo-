module ContainersHelper
  def card_level_badge(level)
    case level
    when "一般"
      content_tag(:p, level, class: "p-1 text-xs text-white bg-green-500 rounded")
    when "重要"
      content_tag(:p, level, class: "p-1 text-xs text-white bg-yellow-600 rounded")
    when "緊急"
      content_tag(:p, level, class: "p-1 text-xs text-white bg-red-500 rounded")
    end
  end

  def highlight_card(tag, params_id, card_id)
    if tag.present? && params_id == card_id
      content_tag(:div, class: "border-orange-1  border-4")
    else
      content_tag(:div, class: "border")
    end
  end
end

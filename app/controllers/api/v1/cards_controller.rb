class Api::V1::CardsController < ApplicationController
  before_action :find_card

  # 獲得卡片的id和新的位置newIndex
  # 返回一個JSON，其中包含更新的卡片id和結果result，值為ok
  def sort
    #寫進資料庫
    if card_permission?(params[:boardId].to_i, params[:containerId].to_i, params[:id].to_i)
      @card.update(container_id: params[:containerId].to_i)
      @card.insert_at(params[:newIndex].to_i)
      render json: { id: params[:id], result: 'ok' }
    else
      render json: { id: params[:id], result: 'false' }
    end
  end

  private
  def card_permission?(board_id, container_id, card_id)
    if current_user.present?
      board = current_user.boards.find(board_id)
      if board.present?
        container = board.containers.find(container_id)
        if container.present?
          card = board.cards.find(card_id)
          if card.present?
            return true
          end
        end
      end
    end
    false
  end

  def find_card
    @card = Card.find_by(id: params[:id])
  end
end

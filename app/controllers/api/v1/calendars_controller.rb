class Api::V1::CalendarsController < ApplicationController
  def show
    if current_user.present?
      cards = current_user.boards.find(params[:boardId]).cards.calendar
      render json: { cards: }
    else
      render json: {}
    end
  end

  def update
    if current_user.present?
      card = current_user.boards.find(params[:boardId]).cards.find(params[:cardId])
      if card.update(daybegin: params[:start], deadline: params[:end])
      else
      end
    end
  end
end

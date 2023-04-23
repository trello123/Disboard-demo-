class Api::V1::CalendarsController < ApplicationController
  def show
    @cards = Card.calendar
    render json: { cards: @cards }
  end

  def update
    @card = Card.find_by(id: params[:cardId])
    if @card.update(daybegin: params[:start], deadline: params[:end])
    else
    end
  end
end

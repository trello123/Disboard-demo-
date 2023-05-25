class CardsController < ApplicationController
  before_action :find_card, except: [:index, :new, :create]
  before_action :load_container

  def index
    @cards = @container.cards.order(:position)
  end

  def new
    @board = @container.board
    @card = Card.new
  end

  def create
    @board = @container.board
    @card = @container.cards.new(card_params)
    if @card.save
      @card.create_message(content: @card.title, room_id: @board.room.id , user_id: current_user.id)
      SendMessageJob.perform_later(@card.message)
      redirect_to board_path(@board.id)
    else
    end
  end

  def show
    @board = @container.board
    @comments = @card.comments.order(created_at: :desc)
  end

  def edit
    @board = @container.board
  end 

  def update
    if @card.update(card_params)
      redirect_to @card.board
    else
    end
  end

  def destroy
    @card.destroy
    redirect_to @card.board
  end

  private
  def card_params
    params.require(:card).permit(:title, :intro, :level, :avatar, :daybegin, :deadline, :container_id, :assigned_to).merge(board: @container.board)
  end

  def find_card
    @card = Card.find(params[:id])
  end

  def load_container
    @container = Container.find(params[:container_id])
    authorize @container.board
  end
end

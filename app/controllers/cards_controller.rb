class CardsController < ApplicationController
  before_action :find_card, except: [:index, :new, :create]
  before_action :load_container, only: [:index, :create, :update]


  def index
    @cards = @container.cards.order(:position)
  end

  def new
    @card = Card.new
  end

  def create
    @board = @container.board
    @card = @container.cards.new(card_params)

    if @card.save
      @card.create_message(content: @card.title, room_id: @board.room.id , user_id: current_user.id)
      SendMessageJob.perform_later(@card.message)
      redirect_to board_containers_path(@board.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    @select_container = @card.container.board.containers.map { |c| [c.title, c.id] }
    @assign_user = @card.container.board.users.map { |u| [u.email, u.email] }.unshift(["尚未指派","尚未指派"])
  end 

  def update
    if @card.update(card_params)
      redirect_to @card.container.board
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @card.destroy
    redirect_to @card.container.board
  end

  private
  def card_params
    params.require(:card).permit(:title, :intro, :level, :avatars, :daybegin, :deadline, :container_id, :assigned_to).merge(board: @container.board)
  end

  def find_card
    @card = Card.find(params[:id])
  end

  def load_container
    @container = Container.find(params[:container_id])
  end
end

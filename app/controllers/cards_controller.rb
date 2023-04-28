class CardsController < ApplicationController
  before_action :find_card, except: [:index, :new, :create]
  before_action :load_container, only: [:index, :create]


  def index
    @cards = @container.cards.order(:position)
  end

  def new
    @card = Card.new
  end

  def create
    @card = @container.cards.new(card_params)
    @board = @container.board
    if @card.save
      redirect_to board_containers_path(@board.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end 

  def update
    if @card.update(card_params)
      redirect_to @card.container.board
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to @card.container.board
  end


  
  private
  def card_params
    params.require(:card).permit(:title, :intro, :level, :avatars)
  end

  def find_card
    @card = Card.find(params[:id])
  end

  def load_container
    @container = Container.find(params[:container_id])
  end
end

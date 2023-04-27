class CardsController < ApplicationController
  before_action :find_card, except: [:index, :new, :create]

  def index
    
    @container = Container.find(params[:container_id])
    @cards = @container.cards.order(:position)
    
  end

  def new
    @card = Card.new
  end

  def create
    @container = Container.find(params[:container_id])
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
      redirect_to @card.container
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to @card.container
  end


  
  private
  def card_params
    params.require(:card).permit(:title, :intro, :level, :avatars)
  end

  def find_card
    @card = Card.find(params[:id])
  end
end

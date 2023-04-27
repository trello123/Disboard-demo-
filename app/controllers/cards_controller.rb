class CardsController < ApplicationController
  before_action :find_card, except: [:index, :new, :create]
  # before_action :authenticate_user!

  def index
    # 改變排序以position為排序
    @cards = Card.order(:position)
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to cards_path 
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
      redirect_to cards_path 
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
  end


  
  private
  def card_params
    params.require(:card).permit(:title, :intro, :level, :avatars)
  end

  def find_card
    @card = Card.find_by!(id: params[:id])
  end
end

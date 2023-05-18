class ContainersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_container, except: [:index, :new, :create]

  def index
    @containers = @board.containers.order(created_at: :asc).includes(:cards)
  end

  def new
    @container = Container.new
  end

  def create
    @container = @board.containers.new(container_params)
    if @container.save
      redirect_to @board
    else
      render :record_not_found
    end
  end

  def show
    authorize @container.board
    @cards = @container.cards.order(:position)
  end

  def edit
    authorize @container.board
  end 

  def update
    authorize @container.board
    if @container.update(container_params)
      redirect_to @container.board
    else
      render :record_not_found
    end
  end

  def destroy
    authorize @container.board
    @container.destroy
  end

  private
  def container_params
    params.require(:container).permit(:title)
  end

  def find_container
    @container = Container.find(params[:id])
  end
end

class ContainersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_container, except: [:index, :new, :create]

  def index
    @board = Board.find(params[:board_id])
    @containers = @board.containers.order(created_at: :desc)
  end

  def new
    @container = Container.new
  end

  def create
    @board = @boards.find(params[:board_id])
    @container = @board.containers.new(container_params)

    if @container.save
      redirect_to  @board
    else
      render :record_not_found
    end
  end

  def show
    @cards = Container.find(params[:id]).cards.order(:position)
  end

  def edit
  end 

  def update  
    if @container.update(container_params)
      redirect_to @container.board
    else
      render :record_not_found
    end
  end

  def destroy
    @container.destroy
    redirect_to @container.board
  end


  private
  def container_params
    params.require(:container).permit(:title)
  end

  def find_container
    @container = Container.find(params[:id])
  end
end

class ContainersController < ApplicationController
  # before_action :authenticate_user!
  before_action :find_container, except: [:index, :new, :create]
  # before_action :find_board, only: [:create]
  before_action :load_containers_and_containers, only: [:show, :edit]
  

  def index
    @containers = Container.order(created_at: :desc)
    @boards = Board.order(created_at: :desc)
    # @board = Board.find_by!(id: params[:board_id])
  end

  def new
    @boards = Board.order(created_at: :desc)
    @container = Container.new
  end

  def create
    @boards = Board.order(created_at: :desc)
    # @board = Board.find_by!(id: params[:container][:board_id])
    # @container = Container.new(container_params)
    # @container.board_id = params[:board_id]
    @board = Board.find_by!(id: params[:board_id])
    @container = @board.containers.new(container_params)

    if @container.save
      redirect_to  @board
    else
      render :new
    end
  end

  def show
  end

  def edit
  end 

  def update  
    if @container.update(container_params)
      redirect_to board_path(board.id)
    else
      render :record_not_found
    end
  end

  def destroy
    @container.destroy
    redirect_to 'board/:id'
  end


  private
  def container_params
    params.require(:container).permit(:title)
  end

  def find_container
    @container = Container.find_by!(id: params[:id])
  end

  # def find_board
  #   @container = Container.find_by!(id: params[:id])
  #   @board = @container.board_id
  # end

  def load_containers_and_containers
    @boards = Board.order(created_at: :desc)
  end
end

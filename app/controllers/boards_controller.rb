class BoardsController < ApplicationController
  # before_action :authenticate_user!
  before_action :find_board, except: [:index, :new, :create]
  before_action :load_boards_and_containers, only: [:show, :edit]
  

  def index
    @boards = Board.order(created_at: :desc)
  end

  def new
    @boards = Board.order(created_at: :desc)  
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      @board.containers.create(title: 'todo')
      @board.containers.create(title: 'doing')
      @board.containers.create(title: 'done')
      redirect_to board_path(@board.id) 
    else
      render :record_not_found
    end
  end

  def show
    # @container = @containers.find_by!(id: params[:id])
  end

  def edit
  end 

  def update
    if @board.update(board_params)
      redirect_to @board
    else
      render :record_not_found
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path 
  end


  private
  def board_params
    params.require(:board).permit(:name)
  end

  def find_board
    @board = Board.find_by!(id: params[:id])
  end

  def load_boards_and_containers
    @boards = Board.order(created_at: :desc)
    @containers = Board.find_by!(id: params[:id]).containers
  end
end

class BoardsController < ApplicationController
  before_action :find_board, except: [:index, :new, :create]
  before_action :authenticate_user!

  def index
    # 改變排序以position為排序
    @boards = Board.order(created_at: :desc)
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(name: '新專案')

    if @board.save
      @board.containers.create(title: 'todo')
      @board.containers.create(title: 'doing')
      @board.containers.create(title: 'done')
      redirect_to boards_path 
    end
  end

  def show
    @boards = Board.order(created_at: :desc)
    @containers = Board.find_by!(id: params[:id]).containers
  end

  def edit
    @boards = Board.order(created_at: :desc)
    @containers = Board.find_by!(id: params[:id]).containers
  end 

  def update
    if @board.update(board_params)
      redirect_to boards_path
    else
      render :edit
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
end

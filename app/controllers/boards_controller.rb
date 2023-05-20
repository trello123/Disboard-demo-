Computer Science and Information Engineering
class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_board, except: [:index, :new, :create]
  before_action :find_containers, only: [:show, :edit]

  def index
    @boards = @boards.page(params[:page]).per(3)
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.create(board_params)
    redirect_to board_path(@board.id) 
  end

  def show
    authorize @board
  end

  def edit
    authorize @board
  end

  def update
    authorize @board

    if @board.update(board_params)
      redirect_to @board, notice: '更新成功'
    else
      render :record_not_found
    end
  end

  def destroy
    authorize @board

    @board.destroy
    redirect_to boards_path, notice: '刪除成功'
  end

  def chart
    authorize @board
    if current_user.status != "Premium"
      redirect_to payments_path
    end
  end

  private
  def board_params
    params.require(:board).permit(:name)
  end

  def find_board
    @board = current_user.boards.find(params[:id])
  end

  def find_containers
    @containers = current_user.boards.find(params[:id]).containers.order(created_at: :asc)
  end
end


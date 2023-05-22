class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_board, except: [:index, :new, :create]
  before_action :load_containers, only: [:show, :edit]

  def index
    @boards = @boards.page(params[:page]).per(3)
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.create(board_params)

    if @board.save
      current_user.board_users.find_by!(board_id: @board.id).update(role: '成員')
      @board.containers.create(title: '待處理')
      @board.containers.create(title: '進行中')
      @board.containers.create(title: '已完成')
      @board.create_room(name: 'room')

      redirect_to board_path(@board.id) 
    else
      render :record_not_found
    end
  end

  def show
    authorize @board
    @light = params[:light]
    @locate_card = params[:locate_card].to_i
    @card = Card.new
  end

  def edit
    authorize @board
  end 

  def update
    authorize @board
    if @board.update(board_params)
      redirect_to boards_path
    else
      render :record_not_found
    end
  end

  def destroy
    authorize @board
    @board.destroy
    redirect_to boards_path 
  end

  def chart
    authorize @board
    if current_user.status != "Premium"
      redirect_to payments_path
    end
  end

  private
  def board_params
    params.require(:board).permit(:name, :avatar)
  end

  def find_board
    @board = Board.find(params[:id])
  end
  def load_containers
    @containers = Board.find(params[:id]).containers.order(created_at: :asc)
  end
end

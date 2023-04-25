class ContainersController < ApplicationController
  # before_action :authenticate_user!
  before_action :find_container, except: [:index, :new, :create]
  before_action :load_boards, only: [:new, :create, :show, :edit]
  

  def new
    @container = Container.new
  end

  def create
    @board = Board.find_by!(id: params[:board_id])
    @container = @board.containers.new(container_params)

    if @container.save
      redirect_to  @board
    else
      render :record_not_found
    end
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
    @container = Container.find_by!(id: params[:id])
  end

  def load_boards
    @boards = Board.order(created_at: :desc)
  end
end

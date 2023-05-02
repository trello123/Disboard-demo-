class RoomsController < ApplicationController
  before_action :load_boards
  before_action :set_message, only: [ :show ]
  before_action :set_room, only: [ :index, :show ]

  def index
    @rooms = Room.all
  end
  def show
    @rooms = Room.all
    render 'index'
  end
  def new
    @room = Room.new
  end
  def create
    @room = Room.new(room_params)
    @room.save
  end
  def set_message
    
  end
  

  private
    def set_room
      @room = Board.find(params[:board_id]).room
    end
    def room_params
      params.require(:room).permit(:name)
    end
    def load_boards
      @boards = Board.order(created_at: :desc)
    end
end

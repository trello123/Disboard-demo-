class RoomsController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  before_action :set_room, only: %i[ show edit update destroy ]

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
      @room = Room.find(params[:id])
    end
    def room_params
      params.require(:room).permit(:name)
    end
end

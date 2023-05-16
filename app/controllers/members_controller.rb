class MembersController < ApplicationController
  before_action :set_search
  
  def index
    @users = @board.users
  end

  def new
    @users = @q.result.find_users_not_in_board(params[:board_id]).select(:id, :email, :username)
  end

  def create
    @user = User.find(params[:member_id])
    if @user.boards.exclude?(@board)
      @user.boards << @board
    end

    redirect_to board_members_path
  end

  private
  def set_search
    @q = User.ransack(params[:q])
  end
end

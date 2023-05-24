class MembersController < ApplicationController
  before_action :set_search
  
  def index
    @users = @board.users.where.not(board_users: { role: '邀請中' })
  end

  def new
    if params[:q].present? && params[:q][:email_or_username_cont].present? && params[:q][:email_or_username_cont].length >= 2
      @users = @q.result.find_users_not_in_board(params[:board_id]).select(:id, :email, :username).limit(5)
    else
      @users = []
    end
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

class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @inventations = current_user.boards.where(board_users: { role: '邀請中' })
  end

  def update
    current_user.board_users.find_by!(board_id: params[:id]).update(role: '成員')

    redirect_to invitations_path
  end

  def destroy
    board_user = current_user.board_users.find_by!(board_id: params[:id])
    board_user.destroy

    redirect_to invitations_path
  end
end

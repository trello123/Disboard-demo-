class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found 
  helper_method :current_user
  before_action :load_boards
  before_action :load_board

  def current_user
    current_user ||= super
  end

  def after_sign_in_path_for(resource)
    if ( current_user.boards.empty? )
      @sample_board = current_user.boards.create(name: '專案範例')
      current_user.board_users.find_by!(board_id: @sample_board.id).update(role: '成員')
      3.times do |i|
        i = i + 1
        @sample_board.containers.create(title: "狀態範例#{i}")
      end
      @sample_board.create_room
      board_path(@sample_board.id)  
    else
      boards_path
    end
  end

  private
  def record_not_found
    render file: Rails.root.join('public', '404.html'),
    layout: false,
    status: 404 and return
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :status])
  end

  def load_boards
    @boards = current_user.boards.where.not(board_users: { role: '邀請中' }).order(created_at: :desc) if current_user
  end

  def load_board
    if params[:board_id].present?
      @board = Board.find(params[:board_id])
      authorize @board
    end
  end

  def user_not_authorized
    redirect_back(fallback_location: boards_path)
  end
end

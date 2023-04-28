class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  helper_method :current_user
  before_action :load_boards
  before_action :load_board

  def current_user
    current_user ||= super
  end

  def after_sign_in_path_for(resource)
    boards_path
  end

  private
  def record_not_found
    render file: Rails.root.join('public', '404.html'),
                  layout: false,
                  status: 404 and return
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
  def load_boards
    @boards = Board.order(created_at: :desc)
  end
  def load_board
    if params[:board_id].present?
      @board = Board.find(params[:board_id])
    end
  end
end

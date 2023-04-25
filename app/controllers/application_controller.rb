class ApplicationController < ActionController::Base
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  def after_sign_in_path_for(resource)
    boards_path
  end

  private
  def record_not_found
    render file: Rails.root.join('public', '404.html'),
                  layout: false,
                  status: 404 and return
  end
end

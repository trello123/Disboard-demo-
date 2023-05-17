class CalendarsController < ApplicationController
  def index
    if current_user.status != "Premium"
      redirect_to payments_path
    end
  end
end

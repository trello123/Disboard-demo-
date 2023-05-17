class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:notify_response]

  def index
    @update_to_premium = Newebpay::Mpg.new("premium_price", current_user.email, current_user.id).form_info
  end

  def create
    @update_to_premium = Newebpay::Mpg.new("premium_price", current_user.email, current_user.id).form_info
  end

  def notify_response
    response = Newebpay::MpgResponse.new(params[:TradeInfo])
    @member_id = response.order_no.split("_").last
    @price = response.amt

    if response.success?
      if @price == 49
        User.find(@member_id).update(status: "Premium")
      end
      redirect_to boards_path
    else
      redirect_to payments_path
    end
  end
end

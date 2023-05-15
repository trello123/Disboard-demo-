class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:notify_response]

  def index
    @form_info = Newebpay::Mpg.new(30, current_user.id).form_info
    @form_info2 = Newebpay::Mpg.new(49, current_user.id).form_info
  end

  def create
    # 要記得附上該筆訂單的資訊，才有辦法建立付款喔！
    @form_info = Newebpay::Mpg.new(30, current_user.id).form_info
    @form_info2 = Newebpay::Mpg.new(49, current_user.id).form_info
  end

  def notify_response
    response = Newebpay::MpgResponse.new(params[:TradeInfo])
    @vip_id = response.order_no.split("_").last
    @amt = response.amt

    if response.success?
      if @amt == 30
        User.find(@vip_id).update(status: "Standard")
      elsif @amt == 49
        User.find(@vip_id).update(status: "Vip")
      end
      redirect_to payments_path
    else
      redirect_to boards_path
    end
  end
end

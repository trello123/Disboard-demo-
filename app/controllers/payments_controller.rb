class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :authenticate_user!

  def index
    @form_info = Newebpay::Mpg.new(30).form_info
    @form_info2 = Newebpay::Mpg.new(60).form_info
  end

  def create
    # 要記得附上該筆訂單的資訊，才有辦法建立付款喔！
    @form_info = Newebpay::Mpg.new(30).form_info
    @form_info2 = Newebpay::Mpg.new(60).form_info
  end

  def notify_response
    response = Newebpay::MpgResponse.new(params[:TradeInfo])

    if response.success?
      redirect_to root_path
    else
      redirect_to boards_path
    end
  end
end

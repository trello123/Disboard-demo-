class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @form_info = Newebpay::Mpg.new.form_info(current_user.id)
  end

  def create
    # 要記得附上該筆訂單的資訊，才有辦法建立付款喔！
    @form_info = Newebpay::Mpg.new(order, current_user.id).form_info(current_user.id)
  end

  def notify_response
    response = Newebpay::MpgResponse.new(params[:TradeInfo])

    if response.success?
      redirect_to boards_path
    else
      redirect_to root_path
    end
  end

end

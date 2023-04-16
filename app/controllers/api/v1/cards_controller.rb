class Api::V1::CardsController < ApplicationController
  before_action :find_card

  # 獲得卡片的id和新的位置newIndex
  # 返回一個JSON，其中包含更新的卡片id和結果result，值為ok
  def sort
      #寫進資料庫
      @card.insert_at(params[:newIndex].to_i)
      render json: {id: params[:id],result: 'ok'}
  end

  private
  def find_card
      @card = Card.find_by(id: params[:id])
  end
end

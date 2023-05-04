class Api::V1::ContainersController < ApplicationController
  before_action :find_container

  def remove
    @container.destroy
    render json: {id: params[:id],result: 'ok'}
  end

  private
  def find_container
    @container = Container.find(params[:id])
  end
end

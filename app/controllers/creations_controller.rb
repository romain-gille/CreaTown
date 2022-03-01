class CreationsController < ApplicationController
  def show
    @creation = Creation.find(params[:id])
  end
end

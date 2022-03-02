class CreationsController < ApplicationController
  def new
    @creation = Creation.new
  end

  def create
    @creation = Creation.new(strong_params)
    # @car.user = User.all.sample
    @creation.user = current_user
    if @creation.save
      redirect_to creation_path(@creation)
    else
      render :new
    end
  end

  def show
    @creation = Creation.find(params[:id])
  end

  private

  def strong_params
    params.require(:creation).permit(:name, :category, :description, :photos)
  end
end

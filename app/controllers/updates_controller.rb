class UpdatesController < ApplicationController
  def index
    @updates = Update.all
  end

  def new
    @update = Update.new
  end

  def create
    @update = Update.create(update_params)
  end

  def show
    @update = Update.find(params[:id])
  end

  private

  def update_params
    params.require(:updates).permit(:title, :description)
  end
end

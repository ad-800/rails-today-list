class UpdatesController < ApplicationController
  def index
    @updates = params[:tag] ? Update.tagged_with(params[:tag]) : Update.all
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
    params.require(:updates).permit(:title, :description, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
  end
end

class UpdatesController < ApplicationController
  def index
    @updates = params[:tag] ? Update.tagged_with(params[:tag]) : Update.order(created_at: :desc).limit(50)
  end

  def create
    @update = Update.create!(title: form_params["title"], description: form_params['description'], user_id: form_params['user_id'])
    @tags = form_params['tag_ids'][1..]
    @tags.each do |tag|
      Tagging.create!(tag_id: tag.to_i, update_id: @update.id)
    end
    redirect_to updates_path
  end

  def show
    @update = Update.find(params[:id])
  end

  private

  def form_params
    params.require(:update).permit(:title, :user_id, :description, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
  end
end

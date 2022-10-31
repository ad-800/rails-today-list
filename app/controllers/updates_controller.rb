class UpdatesController < ApplicationController
  def index
    @updates = params[:tag] ? Update.tagged_with(params[:tag]) : Update.order(created_at: :desc).limit(50)
  end

  def create
    @update = Update.new(title: form_params["title"], description: form_params['description'], user_id: form_params['user_id'])

    if one_a_day?
      flash[:notice] = "Only one update a day."
      redirect_to updates_path
      return
    end

    if @update.save
      @tags = form_params['tag_ids'][1..]
      @tags.each { |tag| Tagging.create!(tag_id: tag.to_i, update_id: @update.id) }
    else
      flash[:notice] = "Please enter a unique title."
    end
    redirect_to updates_path
  end

  def show
    @update = Update.find(params[:id])
  end

  private

  def one_a_day?
    prev_update = current_user.updates.last
    return prev_update && prev_update.created_at.to_date.to_fs(:long_ordinal) == DateTime.now.to_date.to_fs(:long_ordinal)
  end

  def form_params
    params.require(:update).permit(:title, :user_id, :description, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
  end
end

class Update < ApplicationRecord
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, uniqueness: { scope: :user_id }

  def self.tagged_with(name)
    tag_name = Tag.find_by!(category: name)
    taggings = Tagging.where(tag_id: tag_name)
    taggings.map do |tag|
      Update.find_by!(id: tag.update_id)
    end
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:category).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(category: n.strip).first_or_create!
    end
  end
end

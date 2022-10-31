class Update < ApplicationRecord
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, uniqueness: { scope: :user_id }

  def self.tagged_with(name)
    Tag.find_by!(category: name).updates
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

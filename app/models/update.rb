class Update < ApplicationRecord
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, uniqueness: { scope: :user_id }
end

class Tag < ApplicationRecord
  has_many :taggings
  has_many :updates, through: :taggings
end

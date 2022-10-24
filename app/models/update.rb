class Update < ApplicationRecord
  belongs_to :user

  validates :title, uniqueness: { scope: :user_id }
end

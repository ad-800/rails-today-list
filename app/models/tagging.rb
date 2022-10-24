class Tagging < ApplicationRecord
  belongs_to :user, foreign_key: "update_id", class_name: "Update"
  belongs_to :tag
end

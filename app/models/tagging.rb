class Tagging < ApplicationRecord
  belongs_to :tag, foreign_key: "tag_id"
  belongs_to :user, foreign_key: "update_id", class_name: "Update"
end

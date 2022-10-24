class Adduniquenesstoupdate < ActiveRecord::Migration[7.0]
  def change
    add_index :updates, [:title, :user_id], unique: true
  end
end

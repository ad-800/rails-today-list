class CreateUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :updates do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.text :tags, array: true, default: []
      t.references :user
      t.timestamps
    end
  end
end

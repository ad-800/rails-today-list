class Removetagfromupdates < ActiveRecord::Migration[7.0]
  def change
    remove_column :updates, :tags
  end
end

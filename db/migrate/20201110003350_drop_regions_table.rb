class DropRegionsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :regions
  end
end

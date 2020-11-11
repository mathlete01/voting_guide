class RemoveRegionIdFromChoices < ActiveRecord::Migration[5.2]
  def change
    remove_column :choices, :region_id, :integer
  end
end

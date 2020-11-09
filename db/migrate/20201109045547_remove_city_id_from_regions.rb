class RemoveCityIdFromRegions < ActiveRecord::Migration[5.2]
  def change
    remove_column :regions, :city_id, :integer
  end
end

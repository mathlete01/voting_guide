class AddRegionToChoices < ActiveRecord::Migration[5.2]
  def change
    add_column :choices, :region, :string
  end
end

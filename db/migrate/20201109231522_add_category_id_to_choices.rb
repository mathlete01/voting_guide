class AddCategoryIdToChoices < ActiveRecord::Migration[5.2]
  def change
    add_column :choices, :category_id, :integer
  end
end

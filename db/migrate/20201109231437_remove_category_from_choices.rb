class RemoveCategoryFromChoices < ActiveRecord::Migration[5.2]
  def change
    remove_column :choices, :category, :string
  end
end

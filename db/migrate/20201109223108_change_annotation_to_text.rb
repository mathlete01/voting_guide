class ChangeAnnotationToText < ActiveRecord::Migration[5.2]
  def change
    change_column :decisions, :annotation, :text
  end
end

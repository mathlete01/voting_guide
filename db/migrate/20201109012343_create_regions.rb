class CreateRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :regions do |t|
      t.belongs_to :city, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end

class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.integer :year
      t.string :season
      t.references :city, foreign_key: true
      t.references :region, foreign_key: true
      t.string :category
      t.string :choice
      t.text :summary
      t.string :choice_type
      t.string :result

      t.timestamps
    end
  end
end

class CreateDecisions < ActiveRecord::Migration[5.2]
  def change
    create_table :decisions do |t|
      t.references :user, foreign_key: true
      t.references :choice, foreign_key: true
      t.string :decision
      t.string :link
      t.string :annotation

      t.timestamps
    end
  end
end

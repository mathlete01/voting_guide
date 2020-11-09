class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.references :city, foreign_key: true
      t.boolean :group
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin

      t.timestamps
    end
  end
end

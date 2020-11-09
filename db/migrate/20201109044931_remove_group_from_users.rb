class RemoveGroupFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :group, :integer
  end
end

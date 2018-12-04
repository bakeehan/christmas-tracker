class AddBudgetToFriends < ActiveRecord::Migration[5.2]
  def change
    add_column :friends, :budget, :integer, null: false
  end
end

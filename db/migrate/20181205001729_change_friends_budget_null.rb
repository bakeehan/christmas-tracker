class ChangeFriendsBudgetNull < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :friends, :budget, false
  end
end

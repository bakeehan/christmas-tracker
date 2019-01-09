class ChangeFriendsNulls < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :friends, :name, false
  	change_column_null :friends, :user_id, false
  end
end

class ChangeGiftsNulls < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :gifts, :price, false
  	change_column_null :gifts, :title, false
  	change_column_null :gifts, :friend_id, false
  	change_column_null :gifts, :user_id, false
  end
end

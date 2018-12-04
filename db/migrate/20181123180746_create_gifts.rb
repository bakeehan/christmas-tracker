class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
    	t.string :title
    	t.integer :user_id
    	t.integer :friend_id
    	t.integer :price
    end
  end
end

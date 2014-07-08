class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
    	t.integer :user_id
    	t.integer :favoritible_id
    	t.string :favoritible_type

      t.timestamps
    end
  end
end

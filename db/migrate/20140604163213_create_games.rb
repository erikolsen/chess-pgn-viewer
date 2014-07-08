class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :date_played
      t.string :event
      t.string :site
      t.string :eco_code

      t.timestamps
    end
  end
end

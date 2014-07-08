class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :game_id
      t.integer :iteration
      t.string :board_position
      t.string :notation

      t.timestamps
    end
  end
end

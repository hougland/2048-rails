class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :grid
      t.integer :score
      t.boolean :over
      t.boolean :won
      t.boolean :keep_playing

      t.timestamps null: false
    end
  end
end

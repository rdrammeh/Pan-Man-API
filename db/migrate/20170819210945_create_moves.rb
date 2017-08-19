class CreateMoves < ActiveRecord::Migration[5.1]
  def change
    create_table :moves do |t|
      t.integer :latitude, null: false
      t.integer :longitude, null: false
      t.references :game, foreign_key: true, null: false

      t.timestamps
    end
  end
end

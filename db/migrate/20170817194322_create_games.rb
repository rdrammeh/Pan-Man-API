class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :score, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end

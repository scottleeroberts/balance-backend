class CreateGameEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :game_events do |t|
      t.integer :ge_type
      t.datetime :occurred_at
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end

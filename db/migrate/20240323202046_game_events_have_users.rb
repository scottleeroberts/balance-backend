class GameEventsHaveUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :game_events, :user, null: false, foreign_key: true
  end
end

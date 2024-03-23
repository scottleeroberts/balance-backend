class GameEvent < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates_presence_of :occurred_at, :game_id, :user_id

  enum ge_type: {
    completed: 0
  }

  def type
    ge_type
  end
end

class GameEvent < ApplicationRecord
  belongs_to :game

  validates_presence_of :occurred_at, :game_id

  enum ge_type: {
    completed: 0
  }

  def type
    ge_type
  end
end

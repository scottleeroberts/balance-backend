class GameEvent < ApplicationRecord
  belongs_to :game
  belongs_to :user

  after_create :update_user_streak

  validates_presence_of :occurred_at, :game_id, :user_id

  enum ge_type: {
    completed: 0
  }

  def type
    ge_type
  end

  private

  def update_user_streak
    return unless first_game_today?

    if yesterday_played?
      user.increment!(:streak_days)
    elsif !yesterday_played?
      user.update(streak_days: 1)
    end
  end

  def yesterday_played?
    user
      .game_events
      .where(
        occurred_at: Date.yesterday.beginning_of_day..Date.yesterday.end_of_day
      )
      .exists?
  end

  def first_game_today?
    user.game_events
        .where(
          'occurred_at >= ? AND occurred_at < ? AND id != ?',
          Date.today.beginning_of_day, Date.today.end_of_day, id
        )
        .none?
  end
end

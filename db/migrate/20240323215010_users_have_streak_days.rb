class UsersHaveStreakDays < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :streak_days, :integer, default: 0
  end
end

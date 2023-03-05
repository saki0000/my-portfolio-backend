class ChangeDatatypeGoalOfTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :goal, :string
  end
end

class AddGoalToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :goal, :boolean
  end
end

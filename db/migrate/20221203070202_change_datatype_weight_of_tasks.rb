class ChangeDatatypeWeightOfTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :weight, :string
  end
end

class ChangeDatatypeweightOfSubtasks < ActiveRecord::Migration[6.1]
  def change
    change_column :subtasks ,:weight ,:string
  end
end

class AddUserIdToSubtasks < ActiveRecord::Migration[6.1]
  def change
    add_column :subtasks, :user_id, :integer
  end
end

class CreateSubtasks < ActiveRecord::Migration[6.1]
  def change
    create_table :subtasks do |t|
      t.integer :task_id
      t.string :name
      t.string :date
      t.date :due_date
      t.integer :weight
      t.boolean :statement
      t.text :memo

      t.timestamps
    end
  end
end

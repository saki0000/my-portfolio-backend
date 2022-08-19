class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :name
      t.date :date
      t.date :due_date
      t.integer :weight
      t.boolean :statement
      t.text :memo

      t.timestamps
    end
  end
end


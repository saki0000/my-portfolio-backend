class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :user_id
      t.string :name
      t.string :box
      t.date :date
      t.date :due_date
      t.integer :weight
      t.boolean :statement
      t.text :memo

      t.timestamps
    end
  end
end


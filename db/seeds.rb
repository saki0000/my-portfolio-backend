# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..3).each do |i|
    Subtask.create(
      task_id: 1,
      name: "name#{i}",
      date: "today",
      due_date: Date.today,
      weight: i,
      statement: true,
      memo: "memo#{i}"
    )
  end
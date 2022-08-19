# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |i|
    Task.create(
      user_id: i,
      name: "name#{i}",
      date: Date.today,
      due_date: Date.today,
      weight: i,
      statement: false,
      memo: "memo#{i}"
    )
  end
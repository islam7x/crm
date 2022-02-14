# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
columns = Category.find(45).columns

500.times do |i|
  columns.each do |column|
    item = Item.find_or_initialize_by(column_id: column.id, category_id: column.category_id, date_of_create: i.days.ago)
    item.assign_attributes(
      quantity: Random.rand(100),
      weight: Random.rand(500.0).round(2)
    )

    item.save!
  end
end

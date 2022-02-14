# frozen_string_literal: true

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

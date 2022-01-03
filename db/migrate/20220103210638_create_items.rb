# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :quantity
      t.float :weight
      t.integer :column_id
      t.integer :category_id
      t.datetime :datetime_of_create
      t.timestamps
    end
  end
end

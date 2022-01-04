# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :quantity
      t.float :weight
      t.references :column
      t.references :category
      t.datetime :datetime_of_create
      t.timestamps
    end
  end
end

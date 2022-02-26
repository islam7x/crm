# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.integer :parish_id
      t.integer :killed
      t.integer :killed_weight
      t.integer :sold_count
      t.float :sold_weight
      t.date :date_of_create
      t.timestamps
    end
  end
end

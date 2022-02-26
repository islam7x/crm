# frozen_string_literal: true

class CreateParishes < ActiveRecord::Migration[6.1]
  def change
    create_table :parishes do |t|
      t.string :name
      t.integer :quantity
      t.integer :remainder
      t.date :date_of_create
      t.timestamps
    end
  end
end

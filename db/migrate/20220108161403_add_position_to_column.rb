# frozen_string_literal: true

class AddPositionToColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :columns, :position, :integer, default: 1, null: false
  end
end

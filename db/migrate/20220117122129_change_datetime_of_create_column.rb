# frozen_string_literal: true

class ChangeDatetimeOfCreateColumn < ActiveRecord::Migration[6.1]
  def up
    change_column :items, :datetime_of_create, :date
    rename_column :items, :datetime_of_create, :date_of_create
  end

  def down
    change_column :items, :datetime_of_create, :datetime
    rename_column :items, :date_of_create, :datetime_of_create
  end
end

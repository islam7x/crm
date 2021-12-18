class Column < ApplicationRecord
  belongs_to :category
  scope :column, -> { where('deleted_at < ?') }
end

# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :column, optional: true
  belongs_to :category
end

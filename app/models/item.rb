# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :column
  belongs_to :category
end

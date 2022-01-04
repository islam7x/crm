# frozen_string_literal: true

class Column < ApplicationRecord
  belongs_to :category
  has_many :items
end

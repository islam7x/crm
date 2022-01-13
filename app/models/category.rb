# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :columns, -> { order_by_position }, dependent: :destroy

  has_many :items, dependent: :destroy
end

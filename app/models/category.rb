# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :columns, dependent: :destroy
  has_many :items, through: :columns, dependent: :destroy
end

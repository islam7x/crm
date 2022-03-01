# frozen_string_literal: true

class Parish < ApplicationRecord
  has_many :expenses, dependent: :destroy
end

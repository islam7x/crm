# frozen_string_literal: true

class ItemDecorator < ApplicationDecorator
  delegate_all

  def display_value
    return quantity if weight.blank?

    "#{quantity} — #{weight}"
  end
end

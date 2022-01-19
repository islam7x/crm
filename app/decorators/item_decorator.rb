# frozen_string_literal: true

class ItemDecorator < ApplicationDecorator
  delegate_all

  def display_td
    if weight.blank? || quantity.blank?
      return h.content_tag(:td, quantity.presence || weight, class: 'left-td right-td', colspan: '2')
    end

    h.content_tag(:td, quantity, class: 'left-td') + h.content_tag(:td, weight, class: 'right-td')
  end
end

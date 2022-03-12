# frozen_string_literal: true

class ParishDecorator < ApplicationDecorator
  delegate_all

  def display_option(parish_id)
    attrs = { value: id }
    attrs.merge!(selected: true) if id == parish_id.to_i
    h.content_tag(:option, name, attrs)
  end
end

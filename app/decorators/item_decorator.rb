# frozen_string_literal: true

class ItemDecorator < ApplicationDecorator
  delegate_all

  def display_td
    if weight.blank? || quantity.blank?
      return h.content_tag(:td, class: 'left-td right-td actions', colspan: '2') { div_block }
    end

    h.content_tag(:td, quantity, class: 'left-td actions') +
      h.content_tag(:td, weight, class: 'right-td actions') { div_block }
  end

  private

  def div_block
    h.concat(quantity.presence || weight)

    h.concat(
      h.content_tag(:div) do
        h.concat(h.link_to(h.edit_category_item_path(category_id, id)) do
          h.content_tag(:i, class: 'items-icon-edit fas fa-edit') {}
        end)
        if h.current_user.admin?
          h.concat(h.link_to(h.category_item_path(category_id, id), method: :delete,
                                                                    data: { confirm: 'Вы уверены?' }) do
                     h.content_tag(:i, class: 'items-icon-trash fas fa-trash-alt') {}
                   end)
        end
      end
    )
  end
end

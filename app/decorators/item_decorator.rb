# frozen_string_literal: true

class ItemDecorator < ApplicationDecorator
  delegate_all

  def display_td
    if weight.blank? && quantity.blank?
      return h.content_tag(:td, class: 'left-td right-td actions', colspan: '2') { div_block }
    end

    h.content_tag(:td, quantity, class: 'left-td actions') + h.content_tag(:td, weight, class: 'right-td actions') do
                                                               div_block
                                                             end
  end

  private

  def div_block
    h.concat(quantity.presence || weight)

    h.concat(
      h.content_tag(:div) do
        h.concat(h.link_to(h.edit_category_item_path(category_id, id), class: ('center-icon-2 m-1')) do
          h.content_tag(:i, '', class: 'center-icon-2 fas fa-edit')
        end)
        if h.current_user.admin?
          h.concat(h.link_to(h.category_item_path(category_id, id), method: :delete, class: 'center-icon-1 m-1') do
            h.content_tag(:i, '', class: 'center-icon-1 fas fa-trash-alt')
          end)
        end
      end
    )
  end
end

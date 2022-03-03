# frozen_string_literal: true

class ExpenseDecorator < ApplicationDecorator
  delegate_all

  def display_td
    h.content_tag(:td, date_of_create, class: 'actions') { add_icons }
  end

  private

  def add_icons
    h.concat(date_of_create)

    h.concat(
      h.content_tag(:div, class: 'actions') do
        h.concat(
          h.link_to(
            h.edit_parish_expense_path(parish_id, id)
          ) { h.content_tag(:i, '', class: 'icon-edit fas fa-edit') }
        )

        h.concat(
          h.link_to(
            h.parish_expense_path(parish_id, id),
            method: :delete,
            data: { confirm: 'Вы уверены?' }
          ) { h.content_tag(:i, '', class: 'icon-trash fas fa-trash-alt') }
        )
      end
    )
  end
end

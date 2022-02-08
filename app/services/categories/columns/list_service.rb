# frozen_string_literal: true

module Categories
  module Columns
    class ListService < ::ApplicationService
      attr_accessor :to, :from, :category

      def process
        @result =
          category
            .columns
            .not_deleted
            .select('columns.name, columns.position, sum(items.quantity) as sum_quantity, sum(items.weight) as sum_weight')
            .where('items.date_of_create >= :from AND items.date_of_create <= :to',
                   from: from.presence || Date.current.beginning_of_month,
                   to: to.presence || Date.current.end_of_month)
            .left_joins(:items)
            .order_by_position
            .group(:name, :position)
      end
    end
  end
end

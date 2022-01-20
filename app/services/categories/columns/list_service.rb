# frozen_string_literal: true

module Categories
  module Columns
    class ListService < ::ApplicationService
      attr_accessor :category

      def process
        @result =
          category
            .columns
            .select('columns.name, sum(items.quantity) as sum_quantity, sum(items.weight) as sum_weight')
            .order_by_position
            .left_joins(:items)
            .group(:name, :position)
      end
    end
  end
end

# frozen_string_literal: true

module Categories
  module Columns
    class ListService < ::ApplicationService
      attr_accessor :category

      def process
        @result =
          ::Columns::OrderedByPositionSpecification
            .to_scope
            .where(category_id: category.id)
            .joins(:items)
            .select('columns.name, sum(items.quantity) as sum_quantity, sum(items.weight) as sum_weight')
            .group(:name, :position)
      end
    end
  end
end

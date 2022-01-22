# frozen_string_literal: true

module Categories
  module Items
    class ListService < ::ApplicationService
      attr_accessor :to, :from, :category

      def process
        @result = group_items
      end

      private

      def group_items
        items.transform_values do |values|
          columns.map { |column_id| values.find { |item| column_id == item.column_id } }
        end
      end

      def items
        category
          .items
          .where('date_of_create >= :from AND date_of_create <= :to',
                 from: from.presence || Date.current.beginning_of_month,
                 to: to.presence || Date.current.end_of_month)
          .order('items.date_of_create DESC, columns.position ASC')
          .group_by(&:date_of_create)
      end

      def columns
        @columns ||=
          category
            .columns
            .not_deleted
            .left_joins(:items)
            .where('items.date_of_create >= :from AND items.date_of_create <= :to',
                   from: from.presence || Date.current.beginning_of_month,
                   to: to.presence || Date.current.end_of_month)
            .order_by_position
            .ids
            .uniq
      end
    end
  end
end

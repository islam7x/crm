# frozen_string_literal: true

module Categories
  module Items
    class ListService < ::ApplicationService
      attr_reader :items_paginate, :grouped_items
      attr_accessor :to, :from, :category, :page

      def process
        @grouped_items = group_items
        @items_paginate = items
      end

      private

      def group_items
        items.group_by(&:date_of_create).transform_values do |values|
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
          .page(page).per(per_page)
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

      def per_page
        category.columns.count * 31
      end
    end
  end
end

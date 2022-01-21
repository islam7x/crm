# frozen_string_literal: true

module Categories
  module Items
    class ListService < ::ApplicationService
      attr_accessor :category, :from, :to

      def process
        @result = category
          .items
          .where('date_of_create >= :from AND date_of_create <= :to',
                 from: from.presence || Date.current.beginning_of_month,
                 to: to.presence || Date.current.end_of_month)
          .order('items.date_of_create DESC, columns.position ASC')
          .group_by(&:date_of_create)
      end
    end
  end
end

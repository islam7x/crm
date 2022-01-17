# frozen_string_literal: true

module Categories
  module Items
    class ListService < ::ApplicationService
      attr_accessor :category

      def process
        @result = category.items.order('items.date_of_create DESC, columns.position ASC').group_by(&:date_of_create)
      end
    end
  end
end

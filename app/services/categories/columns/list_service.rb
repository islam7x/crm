# frozen_string_literal: true

module Categories
  module Columns
    class ListService < ::ApplicationService
      attr_accessor :category

      def process
        @result = category.columns.order('columns.position ASC')
      end
    end
  end
end

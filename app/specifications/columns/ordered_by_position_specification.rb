# frozen_string_literal: true

module Columns
  class OrderedByPositionSpecification
    class << self
      def to_scope
        Column.order('columns.position ASC')
      end
    end
  end
end

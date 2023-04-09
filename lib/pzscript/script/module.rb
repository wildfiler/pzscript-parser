# frozen_string_literal: true

module Pzscript
  module Script
    # This class represents module in script file.
    #
    # @example
    #   module Base {
    #   }
    class Module < Treetop::Runtime::SyntaxNode
      def id
        identifier.to_s
      end

      def full_id
        id
      end

      # Returns list of item definitions.
      #
      # @return [::Array<Item>]
      def items
        block.items
      end
    end
  end
end

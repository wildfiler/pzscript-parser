# frozen_string_literal: true

module Pzscript
  module Script
    # This class represents item definition in script file.
    class Item < Treetop::Runtime::SyntaxNode
      # Returns id of item
      def id
        identifier.to_s
      end

      # Returns id of item with module id as prefix.
      def full_id
        "#{parent.full_id}.#{id}"
      end

      # Returns source of item definition from input.
      def raw_source
        text_value
      end

      # Return items properties as ruby hash.
      def properties
        block.definitions.to_h
      end
    end
  end
end

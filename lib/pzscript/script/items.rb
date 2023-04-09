# frozen_string_literal: true

module Pzscript
  module Script
    # This class represents list of items definitions in script file.
    class Items < Treetop::Runtime::SyntaxNode
      include Enumerable

      # Returns id of module.
      def full_id
        parent.full_id
      end

      def each(&block)
        elements.each(&block)
      end

      # Returns item by id.
      #
      # @return [Item]
      # @return nil
      def [](id)
        detect { |item| item.id == id }
      end
    end
  end
end

# frozen_string_literal: true

module Pzscript
  module Script
    # This class represents module block(part in curly braces) in script file.
    #
    # @example
    #   module Base {
    #   }
    class ModuleBlock < Treetop::Runtime::SyntaxNode
      def full_id
        parent.full_id
      end
    end
  end
end

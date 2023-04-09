# frozen_string_literal: true

module Pzscript
  module Script
    # Pzscript::Script::False represents false in script file
    class False < Treetop::Runtime::SyntaxNode
      # Always return false
      #
      # @return false
      def to_ruby
        false
      end
    end
  end
end

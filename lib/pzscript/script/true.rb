# frozen_string_literal: true

module Pzscript
  module Script
    # Pzscript::Script::True represents true in script file
    class True < Treetop::Runtime::SyntaxNode
      # Always return true
      #
      # @return true
      def to_ruby
        true
      end
    end
  end
end

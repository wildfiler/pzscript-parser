# frozen_string_literal: true

module Pzscript
  module Script
    # This class represents integers in script file.
    class Integer < Treetop::Runtime::SyntaxNode
      def to_i
        text_value.to_i
      end
      alias to_ruby to_i
    end
  end
end

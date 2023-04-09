# frozen_string_literal: true

module Pzscript
  module Script
    # Pzscript::Script::Float represents float in script file and converts its value to float
    class Float < Treetop::Runtime::SyntaxNode
      # Returns Float value of Node.
      #
      # @return Float
      def to_f
        text_value.to_f
      end
      alias to_ruby to_f
    end
  end
end

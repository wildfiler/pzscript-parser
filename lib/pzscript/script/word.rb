# frozen_string_literal: true

module Pzscript
  module Script
    # This class represents strings in script file.
    class Word < Treetop::Runtime::SyntaxNode
      def to_s
        text_value
      end
      alias to_ruby to_s
    end
  end
end

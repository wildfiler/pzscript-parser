# frozen_string_literal: true

module Pzscript
  module Script
    # This class represents ids and property names in script file.
    module Identifier
      def to_s
        text_value
      end
      alias to_ruby to_s
    end
  end
end

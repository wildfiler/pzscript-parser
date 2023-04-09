# frozen_string_literal: true

module Pzscript
  module Script
    # This class represents line in item definition in script file.
    #
    # @example
    #   DisplayName = Cool Hat
    class Definition < Treetop::Runtime::SyntaxNode
      # Returns definition name.
      # @return [::String]
      def name
        identifier.to_s
      end

      # Returns definition value as respective ruby class instance.
      #
      # @return [::String]
      # @return [::Float]
      # @return [::Integer]
      # @return [::Array]
      # @return [::Hash]
      # @return [::Boolean]
      def value
        rvalue.to_ruby
      end
    end
  end
end
